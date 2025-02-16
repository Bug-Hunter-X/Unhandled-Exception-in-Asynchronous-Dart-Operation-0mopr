```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(jsonData['key']);
    } else {
      throw Exception('HTTP request failed with status: ${response.statusCode}.  Response Body: ${response.body}');
    }
  } on FormatException catch (e) {
    print('Error decoding JSON: $e');
  } on http.ClientException catch (e) {
    print('Network error: $e');
  } catch (e) {
    print('An unexpected error occurred: $e');
  }
}
```