---
description: Summarize conversation issues and blockers, then improve existing ThePlant workflows or create new ones with generalized learnings to prevent future problems.
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Goal

Analyze conversation issues and update workflows with generalized learnings.


## Execution Steps

First, create a task plan using `update_plan`:

```
Call update_plan with:
- explanation: "Workflow improvement from conversation learnings"
- plan: [
    {"step": "Identify issues and blockers from conversation", "status": "pending"},
    {"step": "Discover and read existing workflows", "status": "pending"},
    {"step": "Match issues to target workflows", "status": "pending"},
    {"step": "Apply updates to workflow files", "status": "pending"},
    {"step": "Sync with project templates if they exist", "status": "pending"}
  ]
```

Then execute each step, updating status to `in_progress` before starting and `completed` after finishing.

## Steps

### Step 1: Rules and Issue Identification

**IMPORTANT: Read and follow ALL rules in this step before proceeding.**

#### Critical Rules for Workflow Updates

1. **ALL rules MUST be in Step 1** - When creating or updating workflows, put all critical rules at the beginning of Step 1. Text before the Steps section is NOT read when workflows are nested-executed.

2. **Use generic names** - Use `MyEntity`, `myField` NOT project-specific names like `User`, `Task`.

3. **Use conventional paths** - Use `src/mocks/file.md` NOT absolute paths like `/Users/john/projects/...`.

4. **Focus on principles** - Document the underlying principle, not the specific instance.

5. **Include problem AND solution** - Always show both the problem pattern and the solution.

6. **Avoid duplication** - Check existing workflows before adding new content.

7. **Sync with Project Templates (if they exist)** - Check if the project has template directories like `.specify/`, `docs/`, or similar. If found, keep them consistent with workflow updates.

8. **Update `update_plan` Execution Steps** - When modifying a workflow's steps, also update the `update_plan` call in the "Execution Steps" section to match the actual workflow steps.

#### Issue Identification

**Why:** Systematic issue identification ensures no learnings are lost. Each issue becomes a potential workflow improvement.

Analyze the current conversation and document:

```markdown
## Issues Identified

### Issue 1: [Brief description]
- **What happened**: [Description]
- **Root cause**: [Why it happened]
- **Solution applied**: [How it was fixed]
- **Generalized learning**: [What to document]
- **Target workflow**: [Which theplant.*.md to update]

### Issue 2: ...
```

### Step 2: Discover and Read Existing Workflows

**Why:** Understanding existing workflows prevents duplication and helps identify the right target for new learnings.

1. **Find all workflow files** in the project:
   - Check `.windsurf/workflows/` directory
   - Check global workflows at `~/.codeium/windsurf/global_workflows/`
   - List all `.md` files found

2. **Read each workflow file** to understand:
   - What domain/discipline it covers
   - Its current structure and sections
   - Whether it already contains similar guidance

3. **Document workflow purposes** - For each workflow found, note:
   - Filename
   - Brief description of what it covers
   - Key topics/patterns it addresses

### Step 3: Match Issues to Target Workflows

**Why:** Categorization ensures learnings go to the right workflow file.

For each issue identified in Step 1:
1. Review the workflow summaries from Step 2
2. Determine which workflow best fits the issue
3. If no existing workflow fits, mark for new workflow creation

### Step 4: Apply Updates to Workflow Files

**Why:** Applying updates immediately captures learnings while context is fresh.

Edit the target workflow files with the generalized learnings.

### Step 5: Sync with Project Templates (Optional)

**Why:** Some projects maintain additional documentation that should stay consistent.

Check if the project has any of these directories:
- `.specify/` - Specification templates
- `docs/` - Documentation
- Other template directories

If found, review and update relevant files to maintain consistency with workflow changes.

If Needed, Create New Workflow

If learning represents a new discipline, create `theplant.[discipline-name].md`:

```markdown
---
description: [One-line description]
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Goal

[What this workflow achieves]

## Steps

### Step 1: [First deterministic file change]

[Specific file to create/modify with exact content]

### Step 2: [Next file change]

...

### Step N: [Verification]

[How to verify the workflow worked]
```

**New Workflow Criteria:**
- Doesn't fit naturally into existing workflows
- Addresses recurring pattern across projects
- Has enough depth for its own file
- Follows naming: `theplant.[discipline-name].md`


