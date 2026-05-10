class ProviderModel {
  final String id;
  final String name;
  final String service;
  final String location;
  final String phone;
  final double rating;
  final String experience;
  final String description;
  final bool isVerified;

  ProviderModel({
    required this.id,
    required this.name,
    required this.service,
    required this.location,
    required this.phone,
    required this.rating,
    required this.experience,
    required this.description,
    required this.isVerified,
  });
}