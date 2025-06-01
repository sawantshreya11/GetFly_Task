# 🎓 GetFly Student Portal App

A beautifully designed Flutter app for managing student data through a clean and responsive interface. This project is part of the **GetFly Flutter Internship Task** and focuses on UI/UX, state management, local storage, and clean navigation — everything a student-friendly CRUD app should be! ❤️

---

## ✨ Features

✅ Add, edit, and delete student entries  
✅ Validated form with required fields  
✅ Responsive and visually rich UI using red and complementary theme  
✅ Local data management (offline)  
✅ Flutter navigation between screens  
✅ Reusable widgets and modular codeble

---

## 🧠 Tech Stack

- ⚙️ **Flutter** (Frontend framework)
- 🎨 **Material Design** for modern, consistent UI
- 🧠 **State Management**: `setState()` (simple, lightweig
- 💾 **Local Storage**: Temporary in-memory data (can be extended to Hive or SharedPreferences)

## State Management
-Used Flutter’s built-in **setState()** for managing local UI updates.
-Ideal for simple, screen-level state changes
-No global state needed, so advanced tools like Provider were not required
-Keeps the app lightweight and easy to maintain

Easily upgradable to Provider or Riverpod if global state sharing is needed in futur

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
