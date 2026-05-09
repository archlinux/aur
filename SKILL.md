---
name: skill-creator
description: Create or update Pi skills (SKILL.md plus optional scripts, references, or assets). Use when someone asks to design a new Pi skill, refine an existing one, or structure skills for Pi discovery or packaging.
---

# Skill Creator

Provide guidance for creating effective Pi skills.

## Principles

- **Conciseness**: the agent is already very capable - only domain-specific knowledge, workflows, and tooling it can't infer earn their token cost.
- **Progressive disclosure**: Pi loads skills in tiers - frontmatter (always in context), body (on trigger), bundled resources (on demand) - so splitting content across them keeps context lean.
- **Activation**: Pi decides whether to load a skill based solely on the frontmatter `description`. "When to use" information in the body comes too late.
- **Context over directives**: the agent makes better decisions when it understands why. For tasks requiring judgment, context like "X helps Y because Z" is more robust than instructions like "You MUST do X".

## Pi Agent Skills format

- Required frontmatter: `name`, `description`. Directory name must equal `name`.
- Name rules: 1–64 chars, lowercase letters/digits/hyphens, no leading/trailing/consecutive hyphens.
- Optional frontmatter: `license`, `compatibility`, `metadata` (arbitrary key-value pairs for tooling), `allowed-tools` (restrict which tools the skill may invoke).
- `disable-model-invocation`: when set, Pi won't auto-trigger the skill; the user must invoke it explicitly with `/skill:name`.
- Paths are relative to the skill directory; `{baseDir}` placeholders are not supported.
- Skill locations: `~/.pi/agent/skills/`, `.pi/skills/`, `skills/` in a package, settings `skills`, or `--skill <path>`.

## Recommended structure

```
pi-skill/
├── SKILL.md
├── README.md         # Optional: human summary + installation
├── scripts/          # Optional executables
├── references/       # Optional docs loaded on demand
└── assets/           # Optional templates/assets
```

## Workflow

### 1) Clarify use cases

2-4 concrete example requests usually suffice to scope triggers and functionality.

### 2) Plan reusable resources

For each example, decide if you need:
- **scripts/** for deterministic tasks
- **references/** for long docs or schemas
- **assets/** for templates or boilerplate

### 3) Create the skeleton

A skill needs a directory containing a SKILL.md. Only add resource sub-directories that are actually needed.

```bash
mkdir -p ~/.pi/agent/skills/my-skill
touch ~/.pi/agent/skills/my-skill/SKILL.md
```

### 4) Optional: Write README.md (humans + installation)

If you plan to share the skill with humans, a README.md helps discovery and installation. If you have a README, installation info can live there to save space in SKILL.md.

```markdown
# My Skill

Short summary for humans discovering the skill.

## Installation
`pi install git:github.com/org/my-skill`
```

### 5) Write frontmatter

Use only the fields you need.

```markdown
---
name: my-skill
description: What it does + when to use it.
---
```

If you need to hide auto-invocation, set:

```yaml
disable-model-invocation: true
```

### 6) Write the body

- Imperative phrasing works well for procedural instructions; context framing works better for guidance (see Principles).
- ~500 lines is a practical ceiling for SKILL.md; beyond that, split content into references.
- The agent won't know a reference file exists unless SKILL.md says when to read it.

### 7) Add resources

SKILL.md is the agent's interface to the skill — usage examples and input/output descriptions let it call scripts without needing to understand internals.

- **scripts/**: usage examples in SKILL.md inform the agent how to call them; scripts should be executable.
- **references/**: a table of contents helps the agent navigate files longer than ~100 lines. References work best one level deep from SKILL.md, and each fact should live in one place (SKILL.md or a reference, not both).
- **assets/**: templates, boilerplate, or data used in final output — typically not loaded into context.

### 8) Validate and test

- Run the validator script with system Python 3:

```bash
python3 scripts/validate_skill.py /path/to/my-skill
```

If it fails with `ModuleNotFoundError: No module named 'yaml'`, install the Arch package that provides PyYAML:

```bash
sudo pacman -S python-yaml
```

- Load only the skill to spot warnings:

```bash
pi --no-skills --skill /path/to/my-skill
```

- Invoke it explicitly:

```bash
/skill:my-skill
```

- After edits, use `/reload`.

### 9) Publish (optional)

To share beyond a single machine, publish as a Pi package (package.json-based, not a .skill archive).

- Add `package.json` with a `pi` manifest (or rely on the conventional `skills/` directory).
- Add `"keywords": ["pi-package"]` for discoverability.
- Publish to npm or host in git; install with `pi install <source>` and enable via `pi config` if needed.

```json
{
  "name": "my-pi-skills",
  "keywords": ["pi-package"],
  "pi": { "skills": ["./skills"] }
}
```
