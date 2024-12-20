```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the data here
      final jsonData = jsonDecode(response.body);
      // Incorrect handling of JSON data may lead to errors 
      // If the JSON structure is inconsistent or unexpected. 
      // Example: Assuming jsonData has a 'name' field which is not always present 
      final name = jsonData['name'] ?? 'Unknown'; // Handle missing 'name'
      print('Name: $name');
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    // Additional error handling here.
    // Example rethrow error to be caught by upper layers
    rethrow;
  }
}
```