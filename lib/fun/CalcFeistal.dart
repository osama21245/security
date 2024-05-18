// تحويل النص إلى binary
String textToBinary(String text) {
  return text.codeUnits
      .map((unit) => unit.toRadixString(2).padLeft(8, '0'))
      .join('');
}

// // تحويل binary إلى النص الأصلي
String binaryToText(String binary) {
  return String.fromCharCodes(List.generate(
      binary.length ~/ 8,
      (index) =>
          int.parse(binary.substring(index * 8, index * 8 + 8), radix: 2)));
}

// عملية XOR بين سلسلتين binary
String xor(String a, String b) {
  StringBuffer result = StringBuffer();
  for (int i = 0; i < a.length; i++) {
    result.write((a[i] == b[i]) ? '0' : '1');
  }
  return result.toString();
}

// عملية OR بين سلسلتين binary
String or(String a, String b) {
  StringBuffer result = StringBuffer();
  for (int i = 0; i < a.length; i++) {
    result.write((a[i] == '1' || b[i] == '1') ? '1' : '0');
  }
  return result.toString();
}

// عملية AND بين سلسلتين binary
String and(String a, String b) {
  StringBuffer result = StringBuffer();
  for (int i = 0; i < a.length; i++) {
    result.write((a[i] == '1' && b[i] == '1') ? '1' : '0');
  }
  return result.toString();
}

String feistalCipher1(String plain, String key1, String operation) {
  String result = '';
  String functionResult = '';
  String newRight = '';
  String newLeft = '';

  String left = plain.substring(0, plain.length ~/ 2);
  String right = plain.substring(plain.length ~/ 2);
  newLeft = right;
  if (operation == 'XOR') {
    functionResult = xor(right, key1);
    newRight = xor(functionResult, left);
    return result = newLeft + newRight;
  } else if (operation == 'OR') {
    functionResult = or(right, key1);
    newRight = xor(functionResult, left);
    result = newLeft + newRight;
    return result = newLeft + newRight;
  } else if (operation == 'AND') {
    functionResult = and(right, key1);
    newRight = xor(functionResult, left);
    result = newLeft + newRight;
    return result = newLeft + newRight;
  } else {
    throw Exception('Invalid operation!');
  }
}

String Swap(String text) {
  String newLeft = text.substring(0, text.length ~/ 2);
  String newRight = text.substring(text.length ~/ 2);
  String temp = '';
  temp = newRight;
  newRight = newLeft;
  newLeft = temp;
  return newLeft + newRight;
}

String feistalCipher2(
    String plain, String key1, String key2, String operation, bool isdecript) {
  String result = '';
  String result2 = '';
  if (isdecript) {
    result = feistalCipher1(plain, key2, operation);
    result2 = feistalCipher1(result, key1, operation);
  } else {
    result = feistalCipher1(plain, key1, operation);
    result2 = feistalCipher1(result, key2, operation);
  }

  return Swap(result2);
}

String rc4() {
  List<int> k = [2, 5];
  String msg = "Hi";
  List<int> state = [0, 1, 2, 3];

  // Key setup
  int i = 0;
  int f = 0;
  int g = 0;

  for (int n = 0; n < 4; n++) {
    f = (f + state[i] + k[g]) % 4;
    int temp = state[i];
    state[i] = state[f];
    state[f] = temp;

    i++;
    g = (g + 1) % k.length;
  }

  i = 0;
  f = 0;
  List<int> s = List.from(state);
  i = (i + 1) % 4;
  f = (f + s[i]) % 4;

  int temp = s[i];
  s[i] = s[f];
  s[f] = temp;

  int t = (s[i] + s[f]) % 4;
  int st = s[t];

  return st.toString();
}
