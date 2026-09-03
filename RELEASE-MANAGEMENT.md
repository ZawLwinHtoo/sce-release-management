# Release Management — Software Construction & Evolution

## Overview

This project demonstrates **Release Management** as described in the SCE lecture on Configuration Management (Part II, Section 5).

Release management is the process of **preparing, packaging, and distributing software versions** to end customers. This repository automates the entire release lifecycle using **Git**, **GitHub**, and **semantic-release**.

---

## How It Works

### The Release Pipeline

```
Developer commits → Push to main → GitHub Actions triggers →
  1. Run tests (verify baseline is healthy)
  2. Analyse commit messages (determine version bump)
  3. Generate CHANGELOG.md
  4. Bump version in package.json
  5. Create a Git tag (e.g., v1.0.0)
  6. Package artefacts into release.zip
  7. Publish a GitHub Release with the zip attached
```

### Commit Message Convention

`semantic-release` uses **Conventional Commits** to determine the release type:

| Commit prefix | Release type | Example |
|---------------|-------------|---------|
| `fix:` | Patch (v1.0.**1**) | `fix: correct greeting typo` |
| `feat:` | Minor (v1.**1**.0) | `feat: add farewell function` |
| `feat!:` or `BREAKING CHANGE:` | Major (v**2**.0.0) | `feat!: change greet API signature` |

### Release Types (from Lecture)

| Type | Description | Example |
|------|-------------|---------|
| **Major Release** | Significant new functionality; typically a paid upgrade | v1.0.0 → v2.0.0 |
| **Minor Release** | New features, backward-compatible | v1.0.0 → v1.1.0 |
| **Patch Release** | Bug repairs, security fixes; typically free | v1.0.0 → v1.0.1 |

### Release Package Contents (from Lecture)

Each GitHub Release includes a `release.zip` containing:
- Source code (`src/`)
- Project configuration (`package.json`)
- Documentation (`README.md`, `RELEASE-MANAGEMENT.md`)

This maps to the lecture's list of release package contents:
- ✅ Executable / source files
- ✅ Configuration files
- ✅ Documentation and release notes (auto-generated CHANGELOG)

---

## Quick Start

### 1. Clone the repository
```bash
git clone https://github.com/kaneLuvsCoding/sceTest.git
cd sceTest
npm install
```

### 2. Run tests locally
```bash
npm test
```

### 3. Make a change and trigger a release
```bash
# Make a fix
echo "// patch fix" >> src/index.js
git add .
git commit -m "fix: apply minor patch"
git push origin main
```

The push to `main` triggers the release workflow automatically. Check the **Actions** tab on GitHub to watch it run, and the **Releases** page for the published version.

### 4. Make a feature release
```bash
git commit --allow-empty -m "feat: add new capability"
git push origin main
```

### 5. Make a breaking change release
```bash
git commit --allow-empty -m "feat!: redesign core API"
git push origin main
```

---

## Release Timing Factors (from Lecture)

The lecture identifies key factors that influence **when** to release:
1. **Competitor product features** — market pressure
2. **Marketing commitments and target dates** — business deadlines
3. **OS / platform compatibility changes** — technical necessity
4. **Technical severity of detected faults** — user-impacting bugs

In this demo, releases are triggered automatically on every push to `main` (continuous delivery), but in a real project, teams would use **branch protection rules** and **manual approval gates** to control timing.

---

## Tools Used

| Tool | Purpose |
|------|---------|
| **Git** | Version control, tagging, branching |
| **GitHub** | Remote repository, Releases page, Actions |
| **GitHub Actions** | Automated release pipeline |
| **semantic-release** | Automated version bumping, changelog, and GitHub Release creation |
| **Vitest** | Automated test runner (ensures baseline is healthy before release) |

---

## Lecture Reference

This project maps to **Part II, Section 5 — Release Management** of the Configuration Management lecture:
- Preparing and packaging software versions ✅
- Major vs. minor releases ✅
- Release package contents (binaries, config, docs) ✅
- Release timing factors ✅
- Automated release pipeline ✅
