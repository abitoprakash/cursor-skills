---
name: prism-ui-development
description: Develop UIs using Prism ReactJS v2.44.0. Use when implementing Figma designs, analyzing screenshots for component mapping, or building accessible React interfaces with @nutanix-ui/prism-reactjs.
---

# Prism UI Development (v2.44.0)

## Quick Reference

- **Storybook:** http://prism-styleguide/v2/#/Introduction
- **Package:** `@nutanix-ui/prism-reactjs`
- **Import:** `import { ComponentName } from '@nutanix-ui/prism-reactjs'`

## Analyzing Figma/Screenshots

When given a design to implement:

### Step 1: Identify Layout Structure

Check [component-patterns.md](component-patterns.md) for visual patterns.

Start with layout components:
- `FlexLayout` - Horizontal/inline arrangements
- `StackingLayout` - Vertical stacked sections
- `ContainerLayout` - Content containers with padding
- `Modal` / `SidePanel` - Overlays and panels

### Step 2: Map Visual Elements

Use [component-mapping.md](component-mapping.md) for visual-to-component mapping.

Common mappings:
| Visual Element | Component |
|---------------|-----------|
| Buttons | `Button` |
| Input fields | `Input`, `FormItemInput` |
| Dropdowns | `Select`, `Dropdown` |
| Tables | `Table`, `LocalTable` |
| Modals | `Modal`, `ConfirmModal` |

### Step 3: Access Component Details

Navigate to storybook using chrome-devtools tools:
- Base URL: `http://prism-styleguide/v2/#/`
- Use `user-chrome-devtools-navigate_page` to open storybook
- Use `user-chrome-devtools-take_snapshot` to analyze component examples

## Component Categories

- [Actions](components/actions.md) - Button, ButtonGroup, Dropdown
- [Data Input](components/data-input.md) - Input, Select, Checkbox, Radio, Slider, DatePicker
- [Forms](components/forms.md) - Form, FormItemInput, FormSection
- [Tables](components/tables.md) - Table, LocalTable, WidgetTable
- [Typography](components/typography.md) - Title, Paragraph, Link, TextLabel
- [Layouts](components/layouts.md) - FlexLayout, StackingLayout, Modal, SidePanel
- [Navigation](components/navigation.md) - Tabs, Menu, Breadcrumb, Steps
- [Icons](components/icons.md) - 200+ icon components

## Complex Components (Detailed Docs)

For complex components, see dedicated documentation:
- [Table](components/complex/table.md) - Data tables, editing, selection
- [Modal](components/complex/modal.md) - Modal patterns and accessibility
- [Select](components/complex/select.md) - Selection components
- [Form](components/complex/form.md) - Form composition patterns

## Accessibility Quick Reference

See [accessibility.md](accessibility.md) for full guidelines.

### Key Principles

1. **Semantic HTML** - Use proper elements (`<button>`, `<nav>`, `<main>`)
2. **Unique Labels** - All interactive elements need descriptive labels
3. **Icon Buttons** - Always add `aria-label` for icon-only buttons
4. **Disabled States** - Use `aria-disabled` when tooltip on disabled state is needed
5. **Form Labels** - Every input must have an associated label
6. **Error Messages** - Must be descriptive text, not just color/icons

### Common Patterns

```jsx
// Icon button with aria-label
<Button aria-label="Create VM">
  <PlusIcon aria-hidden="true" />
</Button>

// Disabled with tooltip (use aria-disabled)
<Tooltip content="Feature unavailable">
  <Button aria-disabled={true}>Disabled</Button>
</Tooltip>

// Form input with proper labeling
<FormItemInput
  id="vm-name"
  label="VM Name"
  helpText="Enter a unique name"
  error={hasError}
  errorText="Name is required"
/>
```

## Storybook Navigation

| Component | Storybook URL |
|-----------|--------------|
| Button | `http://prism-styleguide/v2/#/Components/Actions?id=button` |
| Input | `http://prism-styleguide/v2/#/Components/Data%20Input?id=input` |
| Select | `http://prism-styleguide/v2/#/Components/Data%20Input?id=select` |
| Form | `http://prism-styleguide/v2/#/Components/Form?id=form` |
| Table | `http://prism-styleguide/v2/#/Components/Table?id=table` |
| Modal | `http://prism-styleguide/v2/#/Layouts/Sessions?id=modal` |
| Tabs | `http://prism-styleguide/v2/#/Layouts/Navigation?id=tabs` |
| FlexLayout | `http://prism-styleguide/v2/#/Layouts/Structure?id=flexlayout` |
| Icons | `http://prism-styleguide/v2/#/Icons/Overview` |

## Common Import Patterns

```jsx
// Layout components
import {
  FlexLayout,
  StackingLayout,
  ContainerLayout
} from '@nutanix-ui/prism-reactjs';

// Form components
import {
  Form,
  FormItemInput,
  FormItemSelect,
  FormSection
} from '@nutanix-ui/prism-reactjs';

// Action components
import {
  Button,
  Dropdown,
  Menu,
  MenuItem
} from '@nutanix-ui/prism-reactjs';

// Icons (import individually)
import {
  PlusIcon,
  EditIcon,
  CloseIcon,
  ChevronDownIcon
} from '@nutanix-ui/prism-reactjs';
```
