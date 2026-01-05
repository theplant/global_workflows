---
description: Spec-First Development - update spec.md first, then tests, then implementation code
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Goal

Ensure all feature changes follow the spec-first development pattern: specification → tests → implementation. This maintains traceability between requirements, tests, and code.

## Critical Rules (READ FIRST)

1. **NEVER modify implementation code before updating the spec** - The spec is the source of truth
2. **NEVER skip the test update step** - Tests verify the spec is correctly implemented
3. **Spec changes drive test changes, test changes drive code changes** - Not the reverse
4. **Keep spec, tests, and code in sync** - All three must reflect the same requirements

## Steps

### Step 1: Locate and Read the Spec File

**Why:** The spec file defines what should be built. Understanding current state is essential before making changes.

1. Find the relevant `spec.md` file in the `specs/` directory
2. Read the entire spec to understand:
   - User stories and their priorities
   - Acceptance scenarios (Given/When/Then)
   - Functional requirements
   - Key entities and constraints

```bash
# Find spec files
find specs -name "spec.md" -type f

# Read the spec
cat specs/[feature-name]/spec.md
```

### Step 2: Update the Spec File

**Why:** The spec is the contract. Changing it first ensures requirements are clear before implementation begins.

1. Identify which user stories and acceptance scenarios need updating
2. Update or add acceptance scenarios using Given/When/Then format:
   ```markdown
   N. **Given** [precondition], **When** [action], **Then** [expected result]
   ```
3. Update functional requirements if needed (FR-XXX entries)
4. Update key entities if data structures change

**Checklist before proceeding:**
- [ ] All acceptance scenarios are clear and testable
- [ ] Given/When/Then format is consistent
- [ ] Functional requirements align with acceptance scenarios
- [ ] No conflicting requirements exist

### Step 3: Read Related Test Files

**Why:** Tests must verify the spec. Understanding existing tests helps identify what needs updating.

1. Find test files related to the changed user stories
2. Read each test to understand current coverage


### Step 4: Update Tests to Match Spec

**Why:** Tests are the executable specification. They must reflect the updated acceptance scenarios.

1. For each changed acceptance scenario:
   - Find the corresponding test (test name should include scenario ID like `US1-AS1`)
   - Update the test to verify the new Given/When/Then
   - If no test exists, create one following project conventions


**Checklist before proceeding:**
- [ ] Every acceptance scenario has a corresponding test
- [ ] Test names include scenario IDs (US1-AS1, etc.)
- [ ] Tests verify the Given/When/Then from spec

### Step 5: Refactor Implementation Code

**Why:** Implementation should satisfy the spec as verified by tests. Code changes come last.

1. Identify code files that need changes based on spec updates
2. Make minimal changes to satisfy the new requirements
3. Follow existing code patterns and style

**Implementation order:**
1. Types/interfaces (if data structures changed)
2. Core logic (business rules)
3. UI/Commands (user-facing changes)
4. Integration points (APIs, file I/O)

### Step 6: Run Tests and Verify

**Why:** Tests confirm the implementation matches the spec.

**If tests fail:**
1. Read the failure message carefully
2. Trace back to spec - is the test correct per spec?
3. If test is correct, fix implementation
4. If test is wrong, go back to Step 4


## Anti-Patterns to Avoid

| Anti-Pattern | Why It's Wrong | Correct Approach |
|--------------|----------------|------------------|
| Code first, spec later | Spec becomes documentation, not requirements | Spec defines what to build |
| Skip test updates | Tests become stale, don't verify spec | Tests are executable spec |
| Update spec to match code | Reverses the dependency | Code implements spec |
| Delete failing tests | Hides problems | Fix code or update spec |
