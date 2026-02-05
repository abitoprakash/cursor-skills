---
name: generate-prism-skill
description: Generate prism-ui-development skills for a specific prism-ui version. Use when creating or updating prism-ui component documentation skills, when the user mentions generating prism skills, or when preparing prism-ui documentation for a new library version.
---

# Generate Prism UI Skill

This skill guides you through generating a versioned `prism-ui-development` skill by analyzing the prism-ui repository.

## Prerequisites

- Access to the prism-ui repository locally
- Git installed and configured

## Workflow

### Step 1: Gather Information

Use the AskQuestion tool to collect:

1. **Prism UI Library Location**
   - Default: `/Users/abito.prakash/Projects/prism-ui`
   - Ask: "Where is your prism-ui repository located?"

2. **Target Version**
   - Ask: "Which prism-ui version do you want to generate a skill for? (e.g., 2.44.0)"

### Step 2: Git Checkout

Execute these commands in the prism-ui repository:

```bash
cd $PRISM_UI_PATH
git fetch origin --tags
git checkout -- .  # Discard local changes
git branch -D $VERSION 2>/dev/null || true  # Delete existing branch if any
# Try tag first, then branch
git checkout tags/v$VERSION -b $VERSION 2>/dev/null || \
  git checkout tags/$VERSION -b $VERSION 2>/dev/null || \
  git checkout origin/$VERSION -b $VERSION
```

### Step 3: Analyze Repository

Parse the following sources from prism-ui:

| Source | Information to Extract |
|--------|----------------------|
| `services/src/components/v2/*/Component.tsx` | TypeScript interfaces, PropTypes, enums |
| `services/src/components/v2/*/*.examples.md` | Usage examples, accessibility notes |
| `services/accessibility.md` | Global accessibility guidelines |
| `services/src/index.ts` | Export structure, component categorization |
| `services/package.json` | Version, package name |

Run the extraction script:

```bash
bash $WORKSPACE/prism-ui/$VERSION/prism-ui-development/scripts/extract-components.sh $PRISM_UI_PATH
```

### Step 4: Generate Skill Structure

Create the output directory in the workspace:

```
$WORKSPACE/prism-ui/
  $VERSION/
    prism-ui-development/
      SKILL.md
      component-patterns.md
      component-mapping.md
      accessibility.md
      components/
        actions.md
        data-input.md
        forms.md
        layouts.md
        navigation.md
        tables.md
        typography.md
        icons.md
        complex/
          table.md
          modal.md
          select.md
          form.md
      scripts/
        extract-components.sh
    prism-ui-development.zip
```

### Step 5: Generate Files

For each file, use the templates in `templates/` directory as a base and populate with extracted data.

#### Main SKILL.md Content

```markdown
---
name: prism-ui-development
description: Develop UIs using Prism ReactJS v{VERSION}. Use when implementing Figma designs, analyzing screenshots for component mapping, or building accessible React interfaces with @nutanix-ui/prism-reactjs.
---

# Prism UI Development (v{VERSION})

## Quick Reference
- Storybook: http://prism-styleguide/v2/#/Introduction
- Package: `@nutanix-ui/prism-reactjs`
- Import: `import { ComponentName } from '@nutanix-ui/prism-reactjs'`

## Analyzing Figma/Screenshots

When given a design to implement:

1. **Identify Layout Structure**
   - Check [component-patterns.md](component-patterns.md) for visual patterns
   - Start with layout components: FlexLayout, StackingLayout, ContainerLayout

2. **Map Visual Elements to Components**
   - Use [component-mapping.md](component-mapping.md) for visual-to-component mapping
   - Reference storybook URLs for live examples

3. **Access Component Details**
   - Navigate to storybook using chrome-devtools tools
   - Base URL: http://prism-styleguide/v2/#/

## Component Categories

- [Actions](components/actions.md) - Button, ButtonGroup, Dropdown
- [Data Input](components/data-input.md) - Input, Select, Checkbox, Radio, etc.
- [Forms](components/forms.md) - Form, FormItemInput, FormSection
- [Tables](components/tables.md) - Table, LocalTable, WidgetTable
- [Typography](components/typography.md) - Title, Paragraph, Link, TextLabel
- [Layouts](components/layouts.md) - FlexLayout, StackingLayout, Modal, SidePanel
- [Navigation](components/navigation.md) - Tabs, Menu, Breadcrumb, Steps
- [Icons](components/icons.md) - 200+ icon components

## Complex Components (Detailed Docs)

- [Table](components/complex/table.md) - Full table documentation
- [Modal](components/complex/modal.md) - Modal patterns and accessibility
- [Select](components/complex/select.md) - Selection components
- [Form](components/complex/form.md) - Form composition patterns

## Accessibility Quick Reference

See [accessibility.md](accessibility.md) for full guidelines.

Key points:
- Use semantic HTML elements
- All interactive elements need unique, descriptive labels
- Icon-only buttons require `aria-label`
- Use `aria-disabled` instead of `disabled` when tooltip on disabled state is needed
- Form inputs must have associated labels
- Error messages must be descriptive (not just color/icons)
```

### Step 6: Create Zip Archive

```bash
cd $WORKSPACE/prism-ui/$VERSION
zip -r prism-ui-development.zip prism-ui-development/
```

### Step 7: Verify Output

Checklist:
- [ ] SKILL.md has correct version number
- [ ] All component categories have reference files
- [ ] Storybook URLs are correct for the version
- [ ] Accessibility guidelines are extracted
- [ ] Zip file is created and valid

## Component Category Mapping

When analyzing components, categorize them as follows:

| Category | Components |
|----------|-----------|
| Actions | Button, ButtonGroup, Dropdown, RightClickProvider |
| Data Input | Input, TextInput, InputNumber, InputPassword, Select, MultiSelect, Checkbox, Radio, RadioGroup, Slider, TextArea, DatePicker, TimePicker, FileInput, CodeInput |
| Forms | Form, FormItemInput, FormItemSelect, FormItemTextArea, FormItemDatePicker, FormItemTimePicker, FormItemCodeInput, FormItemInputPassword, FormSection |
| Tables | Table, LocalTable, WidgetTable |
| Typography | Title, Paragraph, Link, TextLabel |
| Layouts | FlexLayout, StackingLayout, ContainerLayout, Modal, ConfirmModal, FullPageModal, SidePanel, Overlay, Accordion, Divider, Separator |
| Navigation | Tabs, TabItem, Menu, MenuItem, MenuGroup, Breadcrumb, Steps, StepItem, Pagination, Anchor, ViewSwitcher |
| Data Display | Alert, Badge, StatusIcon, Tooltip, Progress, Loader, Calendar, Carousel |
| Utility | FocusTrap, PortalProvider, Truncate, SrOnly, InfiniteScroll, Notification |

## Storybook URL Patterns

Base URL: `http://prism-styleguide/v2/#/`

| Section | URL Pattern |
|---------|-------------|
| Introduction | `/Introduction` |
| Getting Started | `/Getting%20Started` |
| Accessibility | `/Accessibility` |
| Icons | `/Icons/Overview` |
| Button | `/Components/Actions?id=button` |
| Input | `/Components/Data%20Input?id=input` |
| Form | `/Components/Form?id=form` |
| Table | `/Components/Table?id=table` |
| Modal | `/Layouts/Sessions?id=modal` |
| Tabs | `/Layouts/Navigation?id=tabs` |
| FlexLayout | `/Layouts/Structure?id=flexlayout` |

## Troubleshooting

### Git checkout fails
- Ensure the version tag exists: `git tag -l | grep $VERSION`
- Try without 'v' prefix: `git checkout tags/$VERSION`

### Component not found
- Check if component was added in a later version
- Verify component export in `services/src/index.ts`

### Storybook URL not working
- Some components may have different URL patterns
- Check the navigation menu in storybook for exact paths
