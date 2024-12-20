```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        // Check for 'name' field before accessing it
        final name = jsonData is Map<String, dynamic> && jsonData.containsKey('name') ? jsonData['name'] : 'Unknown';
        print('Name: $name');
        // Handle other fields safely
        final age = jsonData['age'] is int ? jsonData['age'] : 0; 
        print('Age: $age');
      } on FormatException catch (e) {
        print('Invalid JSON format: $e');
      } catch (e) {
        print('Error processing JSON data: $e');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    //Consider more sophisticated error handling in production app
    //for example logging error with unique id and sending it to a monitoring service 
  }
}
```