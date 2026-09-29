import 'dart:io';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/googleapis_auth.dart' as auth;

class DriveService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['https://www.googleapis.com/auth/drive.file'],
  );

  Future<void> backupScan(File image, String fileName) async {
    try {
      final account = _googleSignIn.currentUser ?? await _googleSignIn.signInSilently();
      if (account == null) return;
      final authHeaders = await account.authHeaders;
      final token = authHeaders['Authorization']!.split(' ').last;
      final client = auth.authenticatedClient(
        http.Client(),
        auth.AccessCredentials(
          auth.AccessToken('Bearer', token, DateTime.now().add(Duration(hours: 1)).toUtc()),
          null,
          ['https://www.googleapis.com/auth/drive.file'],
        ),
      );
      final driveApi = drive.DriveApi(client);
      final folderList = await driveApi.files.list(q: "mimeType='application/vnd.google-apps.folder' and name='Sca-N' and trashed=false");
      String folderId;
      if (folderList.files!.isEmpty) {
        final folder = drive.File()..name = 'Sca-N'..mimeType = 'application/vnd.google-apps.folder';
        final created = await driveApi.files.create(folder);
        folderId = created.id!;
      } else {
        folderId = folderList.files!.first.id!;
      }
      final file = drive.File()..name = fileName..parents = [folderId];
      await driveApi.files.create(file, uploadMedia: drive.Media(image.openRead(), image.lengthSync()));
    } catch (e) {
      print('Drive Backup Error: $e');
    }
  }
}
