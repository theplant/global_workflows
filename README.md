# ThePlant Global Workflows

A collection of universal AI workflow patterns for Windsurf IDE. These workflows help AI agents work more effectively by providing structured approaches to common development tasks.

## Installation

Run the following command in your terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/theplant/global_workflows/HEAD/install.sh)"
```

This will install the workflows to `~/.codeium/windsurf/global_workflows`.

## Available Workflows

### `/theplant.root-cause-tracing`

Apply systematic root cause analysis when debugging. This workflow ensures problems are traced backward through the call chain to find the original trigger, rather than applying superficial fixes that mask symptoms.

**Key principles:**
- Trace problems backward through the call chain
- Fix the source, not the symptom
- Never give up on complex issues
- Write failing tests before fixing bugs

### `/theplant.self-correction-loop`

A universal pattern where AI owns the full feedback loop: writing automated checks first, implementing to satisfy them, and iterating until all validations pass.

**Key principles:**
- Define objective success criteria before writing code
- Automated checks must complete in under 30 seconds
- Iterate until all checks pass
- Never present code that "might work"

## Usage

In Windsurf, type the workflow name as a slash command:

```
/theplant.root-cause-tracing
```

or

```
/theplant.self-correction-loop
```

The AI will then follow the structured workflow to complete your task.


## Uninstall

To remove the workflows:

```bash
rm -rf ~/.codeium/windsurf/global_workflows
```

## License

MIT License - see [LICENSE](LICENSE) for details.
