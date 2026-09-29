const functions = require('firebase-functions');
const { GoogleGenerativeAI } = require('@google/generative-ai');

const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY || 'YOUR_KEY');

exports.identifyImage = functions.https.onCall(async (data, context) => {
  const { image, location } = data;
  const model = genAI.getGenerativeModel({ model: 'gemini-1.5-flash' });
  const prompt = `
You are Scanly AI Agent for Scan, Search & Understand Anything.
Identify this image. Return ONLY valid JSON:
{
  "type": "product|place|plant|palm|document|qr|unknown",
  "name": "short name",
  "confidence": 0.8,
  "summary": "2-3 line summary",
  "specs": {"key": "value"},
  "pros": ["pro1"],
  "cons": ["con1"],
  "safety": "safety caution if place",
  "history": "origin/history if place",
  "nearby": []
}
Location: ${location || 'unknown'}
For palm: Start summary with "For entertainment and traditional interpretation only."
`;
  const result = await model.generateContent([
    prompt,
    { inlineData: { data: image, mimeType: 'image/jpeg' } }
  ]);
  let text = result.response.text().replace(/```json|```/g, '').trim();
  try {
    return JSON.parse(text);
  } catch {
    return { type: 'unknown', name: 'Unknown', confidence: 0.6, summary: text, specs: {}, pros: [], cons: [] };
  }
});

exports.askMore = functions.https.onCall(async (data) => {
  const { question, context } = data;
  const model = genAI.getGenerativeModel({ model: 'gemini-1.5-flash' });
  const prompt = `Context: ${JSON.stringify(context)}\nUser question: ${question}\nAnswer concisely.`;
  const result = await model.generateContent(prompt);
  return { answer: result.response.text() };
});
