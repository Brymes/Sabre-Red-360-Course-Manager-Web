/* import 'dart:convert';

class ApiResponse {
  final dynamic data;
  ApiResponse({
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': data,
    };
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ApiResponse(
      data: map['data']?.toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) => ApiResponse.fromMap(json.decode(source));

  @override
  String toString() => 'ApiResponse(data: $data)';
}
 */
