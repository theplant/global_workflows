---
description: AI Self-Correction Loop - A universal pattern where AI owns the full feedback loop: writing automated checks first, implementing to satisfy them, and iterating until all validations pass.
---

## Goal

Transition from "AI as autocomplete" to "AI as owner" by enforcing a closed feedback loop across any domain. The AI must verify its own work through automated checks before presenting results.

## Core Principles

1. **Checks First:** Define objective success criteria (tests, scripts, or automated validations) before writing feature code.
2. **The 30-Second Rule:** Automated checks MUST complete in under 30 seconds to maintain high-velocity AI iteration.
3. **AI-Centric Feedback:** Validation output must be designed for AI consumption, not human review. It should include precise error locations, stack traces, and state dumps.
4. **AI Ownership of Tooling:** The AI chooses the most appropriate validation tools that meet the speed and feedback quality requirements.
5. **Iterate until Green:** Run checks, read failures as actionable feedback, and fix implementation until all criteria are met.
6. **No Half-Baked Results:** Do not present code that "might work." Only present "code + passing checks."

## How to Execute This Workflow

### Phase 1: Preparation (The "Check" Phase)

**Step 1: Document Objective Checks**
- Identify or create the project's primary specification file (e.g., `specs/main-spec.md`, `README.md`, or a dedicated `objective-checks.md`) that lists the success criteria in plain English.
- This document serves as the **source of truth** for both humans and AI.
- For each check, define:
    - **Scenario:** What is being tested?
    - **Expected Outcome:** What constitutes success?
    - **Verification Method:** How will it be automated?

**Step 2: Choose and Implement AI-Centric Automation**
- Select tools that provide the fastest possible feedback loop (aim for <10s, max 30s).
- **Tool Selection Criteria:**
    - **Speed:** Can it run the specific check in seconds?
    - **Precision:** Does it point to the exact file and line of failure?
    - **Rich Context:** Does it provide enough state (variable values, logs) for the AI to diagnose without manual probing?
- **Crucial:** Ensure the automated checks **exactly match** the human-readable documentation from Step 1.
- Write the validation code or scripts.
- **Verify Failure:** Run the checks and verify they fail as expected. This proves the check is valid and the feature is currently missing or broken.

### Phase 2: Implementation (The "Work" Phase)

**Step 3: Research & Implement**
- Research what is best about the objective checks and the current codebase to determine the optimal implementation strategy.
- Implement the feature by applying the best practices and patterns discovered during this research.
- **Goal:** Use the research to implement the best solution that satisfies the checks while maintaining high architectural quality.

**Step 4: Run Checks & Capture Machine-Readable Feedback**
- Execute the validation suite.
- **Time Constraint:** If checks take >30s, refactor them to be more targeted (e.g., test only the affected module).
- **Critical:** Capture ALL output (stderr, logs, trace files). Treat all warnings, console errors, and log exceptions as failures.

### Phase 3: Iteration (The "Loop" Phase)

**Step 5: Analyze & Fix using High-Signal Feedback**
- Read the machine-readable output directly.
- **Actionable AI Feedback includes:**
    - **Precise Locations:** `file:line:column` format for immediate jumping.
    - **State Diffing:** "Expected 'A', but got 'B'" with a clear diff.
    - **Contextual Dumps:** Local variable values at the time of failure, or raw API response bodies.
    - **Traceability:** Full stack traces or call chains leading to the error.
- Use this diagnostic data to identify the root cause. Do not guess.
- Refine implementation.

**Step 6: Repeat until Green**
- Re-run validations after every fix.
- Continue until 100% of checks pass.

## Final Review Criteria
The AI is "done" only when:
1. **Documentation Sync:** The identified specification file is up-to-date and matches the implementation.
2. **Automated Success:** All new and related existing checks pass green.
3. **Clean Feedback:** No new errors, warnings, or regressions were introduced (check logs/output).
4. **Complete Patch:** The diff includes the documentation update, the automated checks, and the implementation.
