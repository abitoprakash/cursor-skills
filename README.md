# Cursor Skills

A collection of Cursor AI skills for development workflows, shared via GitHub for team collaboration.

## Available Skills

### 1. Generate Prism Skill (Meta-Skill)

**Location:** `.cursor/skills/generate-prism-skill/`

A meta-skill that generates `prism-ui-development` skills for specific versions of the Prism UI library. Use this when you need to create documentation for a new prism-ui version.

**Usage:**
1. Have the prism-ui repository cloned locally
2. Invoke the skill in Cursor
3. Provide the prism-ui path and target version
4. The skill will checkout the version, analyze components, and generate documentation

**Or run directly:**
```bash
bash .cursor/skills/generate-prism-skill/scripts/generate-skill.sh \
  /path/to/prism-ui \
  <version> \
  <output-directory>
```

### 2. Prism UI Development Skills

**Location:** `prism-ui/<version>/prism-ui-development/`

Pre-generated skills for specific prism-ui versions. These help developers and AI agents:

- **Identify components** from Figma designs or screenshots
- **Map visual elements** to the correct Prism UI components
- **Access component props** and usage patterns
- **Follow accessibility guidelines** (WCAG 2.1 Level AA)

#### Available Versions

| Version | Location | Zip Download |
|---------|----------|--------------|
| 2.44.0 | `prism-ui/2.44.0/prism-ui-development/` | `prism-ui/2.44.0/prism-ui-development.zip` |

## Using the Skills

### Option 1: Clone the Repository

```bash
git clone https://github.com/abitoprakash/cursor-skills.git
```

Then copy the desired skill folder to your project's `.cursor/skills/` directory.

### Option 2: Download Zip

Download the zip file for your prism-ui version and extract it to your workspace's `.cursor/skills/` directory.

### Option 3: Reference Directly

If you have this repo cloned, you can reference the skills directly in your Cursor settings.

## Skill Structure

### prism-ui-development Skill

```
prism-ui-development/
├── SKILL.md                    # Main skill file
├── component-patterns.md       # Visual pattern recognition guide
├── component-mapping.md        # Figma-to-component mapping table
├── accessibility.md            # WCAG 2.1 accessibility guidelines
├── components/
│   ├── actions.md              # Button, Dropdown, Menu
│   ├── data-input.md           # Input, Select, Checkbox, etc.
│   ├── forms.md                # Form, FormItemInput, etc.
│   ├── layouts.md              # FlexLayout, Modal, SidePanel
│   ├── navigation.md           # Tabs, Breadcrumb, Steps
│   ├── tables.md               # Table, LocalTable
│   ├── typography.md           # Title, Paragraph, Link
│   ├── icons.md                # Icon components overview
│   └── complex/                # Detailed docs for complex components
│       ├── table.md
│       ├── modal.md
│       ├── select.md
│       └── form.md
├── extracted/                  # Raw extracted data from prism-ui
└── scripts/                    # Utility scripts
```

## Contributing

### Adding a New Skill

1. Create a new directory under `.cursor/skills/`
2. Add a `SKILL.md` file with proper frontmatter
3. Follow the [Cursor Skills documentation](https://docs.cursor.com/context/rules-for-ai) for best practices

### Generating a New Prism UI Version

1. Ensure you have the prism-ui repo cloned locally
2. Run the generator script or use the generate-prism-skill skill
3. Commit the generated files to a new version folder

```bash
# Example: Generate for version 2.45.0
bash .cursor/skills/generate-prism-skill/scripts/generate-skill.sh \
  /path/to/prism-ui \
  2.45.0 \
  .
```

## Resources

- [Prism UI Storybook](http://prism-styleguide/v2/#/Introduction)
- [Cursor Skills Documentation](https://docs.cursor.com/context/rules-for-ai)
- [@nutanix-ui/prism-reactjs](https://www.npmjs.com/package/@nutanix-ui/prism-reactjs)
