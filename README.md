# 🎓 GetFly Student Portal App

A beautifully designed Flutter app for managing student data through a clean and responsive interface. This project is part of the **GetFly Flutter Internship Task** and focuses on UI/UX, state management, local storage, and clean navigation — everything a student-friendly CRUD app should be! ❤️

---

## ✨ Features

✅ Add, edit, and delete student entries  
✅ Validated form with required fields  
✅ Responsive and visually rich UI using red and complementary theme  
✅ Local data management (offline)  
✅ Flutter navigation between screens  
✅ Reusable widgets and modular codebase

> ❗**Note:** API integration is intentionally skipped due to time constraints. The logic and UI are designed to plug into APIs easily in the future.

---

## 🧠 Tech Stack

- ⚙️ **Flutter** (Frontend framework)
- 🎨 **Material Design** for modern, consistent UI
- 🧠 **State Management**: `setState()` (simple, lightweight)
- 💾 **Local Storage**: Temporary in-memory data (can be extended to Hive or SharedPreferences)

---

## 🧾 Student Data Fields

The student form and list use the following fields:

| Field         | Type      |
|---------------|-----------|
| `id`          | Integer   |
| `name`        | String    |
| `email`       | String    |
| `date_of_birth` | String (Date) |
| `contact`     | String    |
| `department`  | String    |
| `year`        | String    |
| `address`     | String    |

---

## 🗂️ Project Structure

```bash
lib/
├── main.dart                # App entry point
├── home_page.dart           # Home screen
├── add_student.dart         # Add/Edit student screen
├── student_card.dart        # Reusable student display widget
├── models/
│   └── student.dart         # Student data model
└── utils/
    └── form_validators.dart # Input validation logic
