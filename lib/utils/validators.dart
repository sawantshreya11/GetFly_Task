String? validateNotEmpty(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'This field cannot be empty';
  }
  return null;
}

String? validateEmail(String? value) {
  final pattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (value == null || value.trim().isEmpty) {
    return 'Email is required';
  } else if (!pattern.hasMatch(value)) {
    return 'Enter a valid email';
  }
  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Phone number is required';
  } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
    return 'Enter 10-digit phone number';
  }
  return null;
}

String? validateDate(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Date of birth is required';
  } else if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
    return 'Enter date in YYYY-MM-DD format';
  }
  return null;
}

String? validateYear(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Year is required';
  } else if (!RegExp(r'^[1-4]$').hasMatch(value)) {
    return 'Enter year as 1, 2, 3 or 4';
  }
  return null;
}
