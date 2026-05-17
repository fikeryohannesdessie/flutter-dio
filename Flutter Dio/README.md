# ☁️ Cloud Task App

A Flutter CRUD application that manages **Posts** using the [JSONPlaceholder](https://jsonplaceholder.typicode.com) REST API. Built with clean architecture, Bloc state management, and Dio for networking.

---

## ✨ Features

- 📋 **Read** — Fetch and display all posts from JSONPlaceholder
- ➕ **Create** — Add a new post via a form
- ✏️ **Update** — Edit any existing post
- 🗑️ **Delete** — Remove a post with a confirmation dialog
- ⚡ **Loading states** — Spinner shown during network calls
- ❌ **Error handling** — User-friendly error messages with retry
- 🎨 **Premium dark UI** — Glassmorphism-inspired design with smooth animations

---

## 📸 Screenshots

| Posts List | Create Post | Edit Post |
|:-----------:|:-----------:|:---------:|
| ![Posts List](screenshots/posts_list.png) | ![Create Post](screenshots/create_post.png) | ![Edit Post](screenshots/edit_post.png) |

| Delete Confirmation | Error State |
|:-------------------:|:-----------:|
| ![Delete](screenshots/delete_confirm.png) | ![Error](screenshots/error_state.png) |

---

## 🏗️ Architecture

This project follows **Clean Architecture** with three distinct layers:

```
lib/
├── core/
│   ├── constants/        # API base URL & endpoints
│   ├── errors/           # Failure classes
│   └── network/          # Dio HTTP client singleton
├── features/
│   └── posts/
│       ├── data/
│       │   ├── datasources/    # PostRemoteDataSource (Dio calls)
│       │   ├── models/         # PostModel (JSON <-> Entity)
│       │   └── repositories/   # PostRepositoryImpl
│       ├── domain/
│       │   ├── entities/       # Post entity
│       │   ├── repositories/   # Abstract PostRepository
│       │   └── usecases/       # GetPosts, CreatePost, UpdatePost, DeletePost
│       └── presentation/
│           ├── bloc/           # PostBloc, PostEvent, PostState
│           └── pages/          # PostsListPage, PostFormPage
├── injection_container.dart    # GetIt dependency injection
└── main.dart
```

---

## 📦 Packages Used

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_bloc` | ^8.1.5 | State management (Bloc pattern) |
| `dio` | ^5.4.3 | HTTP networking client |
| `equatable` | ^2.0.5 | Value equality for entities/states |
| `get_it` | ^7.7.0 | Dependency injection service locator |

---

## 🌐 API

All data is fetched from **JSONPlaceholder** — a free, public REST API for testing:

| Operation | Method | Endpoint |
|-----------|--------|----------|
| List all posts | `GET` | `/posts` |
| Get single post | `GET` | `/posts/{id}` |
| Create post | `POST` | `/posts` |
| Update post | `PUT` | `/posts/{id}` |
| Delete post | `DELETE` | `/posts/{id}` |

> **Note:** JSONPlaceholder is a mock API — mutations are simulated server-side and not persisted. The app manages the updated list in-memory after each operation so the UI always reflects the correct state.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK >= 3.5.0
- Dart SDK >= 3.5.0

### Run

```bash
git clone https://github.com/<your-username>/cloud_task_app.git
cd cloud_task_app
flutter pub get
flutter run
```

---

## 🔄 State Flow

```
UI dispatches Event
      |
  PostBloc
      |
  UseCase
      |
  Repository (abstract)
      |
  RepositoryImpl -> RemoteDataSource -> Dio -> JSONPlaceholder API
```

**States:**
- `PostInitial` — app just launched
- `PostLoading` — network request in progress
- `PostLoaded` — posts fetched successfully
- `PostActionSuccess` — create/update/delete completed
- `PostError` — something went wrong

---

## 👨‍💻 Author

Built as a university assignment demonstrating Flutter CRUD, Clean Architecture, Bloc, and Dio.
