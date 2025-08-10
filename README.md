# 🌿 Jynx — A Link Tree-er

Jynx is a modern Ruby on Rails web application that functions as a **link tree-er** — a minimalist, customizable hub for organizing and sharing links, profiles, or anything tree-structured.

This project blueprint outlines the architecture, key features, and deployment details for developers and contributors.

## Preview Jynx Here

Watch Here: (https://youtu.be/5dkDputFysU)


---

## 🚀 Overview

Jynx helps users create and manage visual link trees with user authentication, a clean frontend UI, and PWA support. Built with Rails and containerized for seamless deployment via Fly.io or Render.

---

## 🧱 Architecture

- **Backend:** Ruby on Rails (MVC pattern)
- **Frontend:** ERB views, SCSS/CSS, JavaScript (via importmap)
- **Database:** PostgreSQL / SQLite (configurable via `database.yml`)
- **Authentication:** Devise gem
- **Deployment:** Dockerized; supports Fly.io & Render
- **PWA Support:** Installable experience for mobile/desktop

---

## ✨ Key Functionalities

### 1. User Authentication
- Devise for registration, login, password resets
- User model: `app/models/user.rb`

### 2. Tree Management
- Full CRUD support for user-generated trees
- Slug-based friendly URLs
- Tree logic: `app/models/tree.rb`
- Controller: `app/controllers/trees_controller.rb`

### 3. Frontend/UI
- Responsive views (`app/views/`)
- Custom themes and layouts via SCSS (`app/assets/stylesheets/`)
- JS controllers for interactivity (`app/javascript/controllers/`)
- Particle backgrounds, animations, and avatars

### 4. PWA Support
- Installable as a web app
- Manifest and icons located in `public/`
- PWA views in `app/views/pwa/`

### 5. Deployment & Configuration
- `Dockerfile` for container builds
- `fly.toml` / `render.yaml` for platform configs
- Environment setup in `config/environments/`

### 6. Background Jobs & Mailers
- Async tasks: `app/jobs/`
- Email templates and logic: `app/mailers/`

### 7. Testing
- Unit and system tests in `test/`
- Fixtures for test data

### 8. Security & Credentials
- Encrypted credentials via `config/credentials.yml.enc`
- Content Security Policy config in `initializers/`

---

## 🔄 How It Works

1. **Startup**  
   - App loads settings from `config/`
   - DB migrations and seed setup
   - Asset compilation for production

2. **User Flow**  
   - Signup/login with Devise  
   - Users create/view/edit/delete their tree  
   - Trees displayed with nested views and dynamic UI

3. **Routing**  
   - RESTful routes in `config/routes.rb`

4. **Deployment**  
   - Build with Docker  
   - Deploy via Fly.io or Render with minimal setup

---

## 📂 Notable File Structure

| File / Folder                     | Purpose                                 |
|----------------------------------|-----------------------------------------|
| `app/models/tree.rb`             | Tree logic & relationships              |
| `app/controllers/trees_controller.rb` | CRUD for trees                    |
| `app/views/trees/`               | Tree UI templates                       |
| `app/models/user.rb`             | Devise authentication                   |
| `app/controllers/home_controller.rb` | Landing page logic                 |
| `config/routes.rb`               | Application routing                     |
| `Dockerfile`                     | App container config                    |
| `fly.toml` / `render.yaml`       | Deployment configs                      |
| `app/assets/`                    | SCSS, images, and frontend assets       |
| `app/javascript/`                | Interactive JS via importmap            |

---

## 🛠️ Built With

- **Ruby on Rails**
- **Devise** — Auth
- **Importmap** — JS management
- **Docker** — Containerization
- **Fly.io / Render** — Deployment
- **PWA Standards** — Installable experience

---

## 📌 License

This project is open-source and available under the [MIT License](LICENSE).

---

## 🧪 Want to Contribute?

Feel free to fork the repo, open issues, or create pull requests. Contributions, bug reports, and feature ideas are always welcome!

---

## 🙏 Acknowledgments

Inspired by link-in-bio tools like Linktree. Built for learning, fun, and practical deployment.

---

Made with ❤️ by [@jcodes](https://github.com/jcodes)
