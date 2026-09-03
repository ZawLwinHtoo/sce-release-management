# Software Construction and Evolution: Configuration Management
**Reference Textbook:** *Software Engineering*, Ian Sommerville, 10th edition, 2016.  
**Institution:** University of Information Technology (UIT), Faculty of Information Science.

---

# Part I: Configuration Management & Version Control

## 1. Objectives & Overview
- Introduce software configuration management (CM) processes and tools[cite: 3].
- Understand essential functionality of version control (VC) systems (centralized vs. distributed)[cite: 3].
- Understand challenges of system building and advantages of continuous integration (CI)[cite: 3].
- Understand software change management processes and release management[cite: 3].

## 2. Configuration Management (CM) Fundamentals
* **Definition:** Configuration management is concerned with the policies, processes, and tools for managing changing software systems[cite: 3].
* **Context:** Software systems change constantly during development and use, producing multiple concurrent versions that must be maintained[cite: 3].
* **Risks of Poor CM:**
  - Modifying the wrong version of a system[cite: 3].
  - Delivering the wrong build/version to end users[cite: 3].
  - Losing track of where source code for a specific version/component is stored[cite: 3].
* **Team vs. Individual Use:** Useful for individual developers to track modifications; vital for distributed teams working simultaneously across multiple geographical locations[cite: 3].

## 3. Four Core CM Activities
1. **Version Control:** Tracking multiple component versions and preventing simultaneous modifications by multiple developers from interfering with each other[cite: 3].
2. **System Building:** Assembling code components, data, and libraries, then compiling and linking them into an executable target system[cite: 3].
3. **Change Management:** Tracking requests for changes (bug fixes, enhancements), evaluating cost and impact, and deciding whether and when to apply them[cite: 3].
4. **Release Management:** Preparing software for external distribution and tracking customer-facing released versions[cite: 3].

## 4. Software Development Phases & Quality Management
1. **Development Phase:** Development team manages configuration; actively adds new features[cite: 3].
2. **System Testing Phase:** Pre-release version handed to Quality Management (QM)[cite: 3]. No new features added; focuses on bug fixes, performance, and security patches (may include beta testers)[cite: 3].
3. **Release Phase:** Software distributed to customers; ongoing reception of bug reports and change requests[cite: 3].
* **Controlled System:** Once QM confirms acceptable quality, the system becomes "controlled," requiring formal review and approval for any subsequent modifications[cite: 3].

## 5. Core CM Terminology
| Term | Formal Definition |
| :--- | :--- |
| **Baseline** | A controlled collection of component versions making up a system. Components cannot be modified; a baseline can always be recreated from its constituent components[cite: 3]. |
| **Codeline** | A sequence of source code versions, with later versions derived from earlier versions[cite: 3]. |
| **Mainline** | A sequence of baselines representing different system versions[cite: 3]. |
| **Branching** | Creating a new independent codeline from an existing version[cite: 3]. |
| **Merging** | Combining separate versions from different codelines into a single cohesive version[cite: 3]. |
| **Configuration Item (SCI)** | Any project artifact (code, test data, document, design) placed under configuration control with a unique identifier[cite: 3]. |
| **Repository** | A shared database storing component versions and change metadata[cite: 3]. |
| **Workspace** | A private local work area where code can be edited without impacting other developers[cite: 3]. |
| **Release** | A version distributed externally to customers or users[cite: 3]. |
| **System Building** | Compiling and linking constituent versions, libraries, and components into an executable system[cite: 3]. |

## 6. Version Control Architecture: Centralized vs. Distributed

### A. Centralized VC System
* Uses a single master repository server containing all versions[cite: 3].
* Developers check out files/directories into their private workspace, make modifications, and check them back in[cite: 3].
* Concurrency control: Warns developers if a file has already been checked out by someone else[cite: 3].

### B. Distributed VC System (e.g., Git)
* Master repository exists on a server, but developers create an entire local **clone** of the repository on their own machine[cite: 3].
* Developers commit changes to their local private repository before pushing to the central/public server[cite: 3].
* **Advantages:**
  1. Built-in repository backup mechanism across developer machines[cite: 3].
  2. Enables offline work without network connectivity[cite: 3].
  3. Supports comprehensive local compiling and testing before publishing changes[cite: 3].
  4. Indispensable for open-source workflows (developers push to public repositories; maintainers selectively pull verified changes)[cite: 3].

## 7. Storage Management & Deltas
* To minimize disk usage, version control systems avoid saving full duplicate copies of identical files[cite: 3].
* **Deltas:** Differences between subsequent file versions stored as lists of changed lines[cite: 3].
* Typical strategy: Store the latest/most recent version in full, then apply historical deltas backward to reconstruct older versions when required[cite: 3].

---

# Part II: System Building, Change Management & Release Management

## 1. System Building
* **Definition:** Compiling and linking source code components, external libraries, data files, configuration files, and tools into an executable system[cite: 4].
* Must tightly integrate with version control systems to pull specific baseline component versions[cite: 4].
* **Core Tool Features:**
  - *Build script generation:* Parses code structure and dependencies to create build configurations automatically[cite: 4].
  - *VCS integration:* Checks out designated component versions automatically[cite: 4].
  - *Minimal recompilation:* Analyzes modified source code to recompile only changed components, saving time[cite: 4].
  - *Executable system creation:* Links object code with external libraries[cite: 4].
  - *Test automation:* Automatically runs predefined executable test suites[cite: 4].
  - *Reporting:* Generates pass/fail metrics, error traces, and warnings[cite: 4].
  - *Documentation generation:* Automatically creates release notes and manuals[cite: 4].

## 2. Continuous Integration (CI)
* Highly frequent system building combined with automated test execution to surface integration defects immediately[cite: 4].
* **7-Step CI Process (Sommerville Flow):**
  1. Extract latest mainline code into developer's private workspace[cite: 4].
  2. Build system and run automated tests locally[cite: 4].
  3. Implement code changes / bug fixes[cite: 4].
  4. Build and rerun tests locally in private workspace[cite: 4].
  5. Check modified code into the central build server (without committing directly to the mainline baseline)[cite: 4].
  6. Build server runs isolated compile and automated regression tests[cite: 4].
  7. If build server tests succeed, commit changes as a new baseline in the system mainline[cite: 4].
* **Benefits:** Early discovery of developer interaction bugs; guarantees the mainline is always an authoritative, working system[cite: 4].
* **Limitations:** Very large systems may incur long build/test times; differences between development environments and target deployment hardware can limit local test fidelity[cite: 4].

## 3. Code Identification: Compilation & Linking Signatures
To verify which source code produced a given object file, build systems use:
* **Time-based identification:** Comparing source and object timestamps[cite: 4].
* **Checksum-based identification:** Cryptographic hashing of source code content to detect changes accurately regardless of file timestamp differences[cite: 4].

## 4. Change Management
* Systematic evaluation of costs, impacts, and benefits before making changes to a production or controlled system[cite: 4].
* **Change Request Form (CRF):**
  - Tracks requester, change description, affected components, cost/effort estimate, priority, and implementation decisions[cite: 4].
  - Reviewed and approved by the **Change Control Board (CCB)**[cite: 4].
* **Decision Factors:**
  - Consequences of rejection (what breaks if ignored)[cite: 4].
  - Benefits and number of users impacted[cite: 4].
  - Implementation cost, effort, and component dependencies[cite: 4].
  - Product release schedule alignment[cite: 4].

## 5. Release Management
* Preparing, packaging, and distributing software versions to end customers[cite: 4].
* **Release Types:**
  - *Major Releases:* Significant new functionality; typically paid upgrades[cite: 4].
  - *Minor Releases:* Bug repairs, patches, and security fixes; typically free[cite: 4].
* **Release Package Contents:**
  - Executable binaries, configuration files, and localized data files[cite: 4].
  - Installation programs and scripts[cite: 4].
  - Paper/electronic documentation, user guides, and release notes[cite: 4].
* **Release Timing Factors:**
  - Competitor product features[cite: 4].
  - Marketing commitments and target dates[cite: 4].
  - Operating system / platform compatibility changes[cite: 4].
  - Technical severity of detected production faults[cite: 4].