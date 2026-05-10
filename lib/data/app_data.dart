import '../models/provider_model.dart';
import '../models/user_model.dart';

final List<String> appServices = [
  "All",
  "Plumber",
  "Electrician",
  "Tutor",
  "Cleaner",
  "Barber",
  "Mechanic",
];

final List<UserModel> sampleUsers = [
  UserModel(
    fullName: "Demo User",
    email: "demo@example.com",
    phone: "+251 900 000 000",
    location: "Addis Ababa",
    password: "123456",
    role: "Customer",
  ),
];

final List<ProviderModel> sampleProviders = [
  ProviderModel(
    id: "1",
    name: "Abebe Plumbing Service",
    service: "Plumber",
    location: "Bole, Addis Ababa",
    phone: "+251 911 111 111",
    rating: 4.5,
    experience: "5 years",
    description: "Fixes water pipes, sinks, toilets, and home plumbing problems.",
    isVerified: true,
  ),
  ProviderModel(
    id: "2",
    name: "Dawit Electric Works",
    service: "Electrician",
    location: "CMC, Addis Ababa",
    phone: "+251 922 222 222",
    rating: 4.3,
    experience: "4 years",
    description: "Electrical installation, repair, and maintenance service.",
    isVerified: true,
  ),
  ProviderModel(
    id: "3",
    name: "Tigist Home Tutor",
    service: "Tutor",
    location: "Megenagna, Addis Ababa",
    phone: "+251 933 333 333",
    rating: 4.8,
    experience: "6 years",
    description: "Math and English tutor for school students.",
    isVerified: true,
  ),
  ProviderModel(
    id: "4",
    name: "CleanPro Service",
    service: "Cleaner",
    location: "Kazanchis, Addis Ababa",
    phone: "+251 944 444 444",
    rating: 4.6,
    experience: "3 years",
    description: "Home, apartment, and office cleaning service.",
    isVerified: false,
  ),
  ProviderModel(
    id: "5",
    name: "Modern Barber Shop",
    service: "Barber",
    location: "Piassa, Addis Ababa",
    phone: "+251 955 555 555",
    rating: 4.7,
    experience: "7 years",
    description: "Haircut, shaving, and grooming service.",
    isVerified: true,
  ),
  ProviderModel(
    id: "6",
    name: "Fast Auto Mechanic",
    service: "Mechanic",
    location: "Mexico, Addis Ababa",
    phone: "+251 966 666 666",
    rating: 4.4,
    experience: "8 years",
    description: "Car repair, oil change, and engine checking service.",
    isVerified: true,
  ),
];