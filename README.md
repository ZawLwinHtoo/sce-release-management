# Release Management Demo

**Software Construction & Evolution — Configuration Management**

## What Is This?

A demonstration of **Release Management** using Git, GitHub, and automated tooling. When code is pushed to `main`, a GitHub Actions pipeline automatically:

1. ✅ Runs tests to verify the codebase is healthy
2. 📋 Analyses commit messages to determine the version bump (patch / minor / major)
3. 📝 Generates a `CHANGELOG.md`
4. 🏷️ Creates a Git tag (e.g., `v1.0.0`)
5. 📦 Packages source files into `release.zip`
6. 🚀 Publishes a **GitHub Release** with the zip attached

## Project Structure

```
sceTest/
├── .github/workflows/
│   └── release.yml             ← Automated release pipeline
├── src/
│   └── index.js                ← Application source code
├── tests/
│   └── index.test.js           ← Automated tests
├── .releaserc.json             ← semantic-release configuration
├── package.json                ← Project config & dependencies
├── RELEASE-MANAGEMENT.md       ← Detailed release management guide
└── README.md                   ← This file
```

## Quick Start

```bash
# Clone & install
git clone https://github.com/ZawLwinHtoo/sce-release-management.git
cd sce-release-management
npm install

# Run tests
npm test
```

## Triggering a Release

Use **Conventional Commits** to control what kind of release is created:

```bash
# Patch release (v1.0.0 → v1.0.1)
git commit -m "fix: correct a bug"

# Minor release (v1.0.0 → v1.1.0)
git commit -m "feat: add new feature"

# Major release (v1.0.0 → v2.0.0)
git commit -m "feat!: breaking API change"

# Push to trigger the pipeline
git push origin main
```

Then check the **Actions** and **Releases** tabs on GitHub.

## Tools

- **Git & GitHub** — Version control & release hosting
- **GitHub Actions** — Automated pipeline
- **semantic-release** — Automated versioning & changelog
- **Vitest** — Test runner

## Lecture Reference

See [RELEASE-MANAGEMENT.md](RELEASE-MANAGEMENT.md) for a detailed mapping of this project to the lecture material on Release Management.