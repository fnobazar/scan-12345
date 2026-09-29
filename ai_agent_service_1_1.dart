import 'dart:convert';
import 'dart:io';
import 'package:cloud_functions/cloud_functions.dart';
import '../models/scan_result.dart';

class AiAgentService {
  final _functions = FirebaseFunctions.instance;

  Future<ScanResult> identifyAnything(File image, {String? locationTag}) async {
    final bytes = await image.readAsBytes();
    final base64Image = base64Encode(bytes);
    final callable = _functions.httpsCallable('identifyImage');
    final res = await callable.call({
      'image': base64Image,
      'location': locationTag,
    });
    final data = Map<String, dynamic>.from(res.data);
    data['imagePath'] = image.path;
    return ScanResult.fromJson(data);
  }

  Stream<String> askMore({required String question, required ScanResult context}) async* {
    final callable = _functions.httpsCallable('askMore');
    final res = await callable.call({
      'question': question,
      'context': context.toJson(),
    });
    final answer = res.data['answer'] as String;
    for (var word in answer.split(' ')) {
      await Future.delayed(Duration(milliseconds: 40));
      yield '$word ';
    }
  }
}
