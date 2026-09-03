# TASK: Automated System Building & CI Pipeline Demonstration

## Objective
Demonstrate Automated System Building and Continuous Integration from Lecture 5-II using GitHub Actions:
1. Automated compilation/building[cite: 1]
2. Automated test execution[cite: 1]
3. Preventing defective code from entering the mainline baseline[cite: 1]

## Implementation Instructions for the Agent
1. **Minimal Code & Test:**
   - Initialize a minimal project (e.g., Node.js with `vitest` or Python with `pytest`).
   - Write a core math/logic function: `calculateTotal()`.
   - Write an automated unit test verifying its correctness[cite: 1].

2. **Build Configuration:**
   - Configure a command to run tests automatically (e.g., `npm test` or `pytest`)[cite: 1].

3. **CI Pipeline Configuration:**
   - Create `.github/workflows/ci.yml`.
   - Configure it to trigger on `push` and `pull_request` to `main`.
   - Pipeline steps:
     1. Checkout code[cite: 1]
     2. Setup environment[cite: 1]
     3. Install dependencies[cite: 1]
     4. Run automated tests[cite: 1]

4. **Demo Scenario:**
   - **Step A:** Push working code -> Show CI passing (Green check)[cite: 1].
   - **Step B:** Break the test on a branch (e.g., `expect(1 + 1).toBe(3)`) -> Show CI failing (Red cross) and blocking the merge to baseline[cite: 1].

## Deliverable
A ready-to-use repository structure with `.github/workflows/ci.yml`, test files, and a short script demonstrating the Pass vs Fail pipeline run[cite: 1].