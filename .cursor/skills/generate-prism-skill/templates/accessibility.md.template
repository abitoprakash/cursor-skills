# Prism UI Accessibility Guidelines

The Prism ReactJS component library meets WCAG 2.1, Level AA standards. This guide summarizes key accessibility practices for developers.

## Core Principles

### 1. Semantic HTML

Use proper HTML elements for their intended purpose:

- `<button>` for clickable actions
- `<nav>` for navigation sections
- `<header>`, `<main>`, `<footer>` for page structure
- `<section>` for distinct content areas

**Avoid:** Using `<div>` or `<span>` with click handlers instead of proper elements.

### 2. Logical Heading Structure

- Use headings sequentially (`h1` → `h2` → `h3`)
- Don't skip heading levels
- Screen readers use headings for navigation

```jsx
// Good
<Title size="h1">Page Title</Title>
<Title size="h2">Section Title</Title>
<Title size="h3">Subsection Title</Title>

// Bad - skips h2
<Title size="h1">Page Title</Title>
<Title size="h3">Section Title</Title>
```

### 3. Predictable Focus Order

- Interactive elements should follow logical DOM order
- Avoid reordering with CSS that breaks tab sequence
- Use `tabindex="0"` for focusable non-interactive elements
- Use `tabindex="-1"` for programmatic focus (not tab order)

**Never use `tabindex` values other than 0 or -1.**

### 4. ARIA Landmarks

Use landmarks to define page regions:

```jsx
<main>
  <nav aria-label="Main navigation">...</nav>
  <section aria-labelledby="section-title">...</section>
</main>
```

## Button Accessibility

### Unique, Descriptive Labels

All buttons must have unique, descriptive labels:

```jsx
// Good - clear action
<Button>Create Virtual Machine</Button>

// Bad - vague
<Button>Click Here</Button>
```

### Icon-Only Buttons

Icon buttons **must** have `aria-label`:

```jsx
// Good
<Button aria-label="Delete item">
  <CloseIcon aria-hidden="true" />
</Button>

// Bad - no accessible name
<Button>
  <CloseIcon />
</Button>
```

### Button with Count

When using count prop, provide context via `aria-label`:

```jsx
// Good - provides context
<Button aria-label="Upgrade 3 VMs" count={3}>
  Upgrade
</Button>

// Acceptable - uses default "items" context
<Button count={3}>Deploy</Button>
```

### Disabled vs aria-disabled

| Property | Behavior | Use Case |
|----------|----------|----------|
| `disabled` | Not focusable, skipped in tab order | Standard disabled state |
| `aria-disabled` | Focusable, can show tooltips | When disabled tooltip is needed |

```jsx
// Standard disabled
<Button disabled>Cannot Submit</Button>

// Focusable disabled (for tooltip)
<Tooltip content="Feature requires admin access">
  <Button aria-disabled={true}>Admin Only</Button>
</Tooltip>
```

**Never use both `disabled` and `aria-disabled` together.**

## Icon Usage

### Decorative Icons

Icons that don't convey meaning should be hidden:

```jsx
<Button>
  <PlusIcon aria-hidden="true" /> Create VM
</Button>
```

### Informative Icons

Icons that convey information need accessible text:

```jsx
// Method 1: aria-label on icon
<StatusIcon
  type={StatusIcon.StatusIconTypes.WARNING}
  aria-hidden="false"
  aria-label="Warning status"
/>

// Method 2: Visible text nearby
<FlexLayout>
  <StatusIcon type={StatusIcon.StatusIconTypes.ERROR} />
  <span>Error: Connection failed</span>
</FlexLayout>
```

### Icon Buttons with Tooltips

```jsx
<Tooltip content="Edit settings" oldTooltip={false}>
  <Button aria-label="Edit settings">
    <EditIcon aria-hidden="true" />
  </Button>
</Tooltip>
```

## Form Accessibility

### Label Requirements

Every input **must** have a label:

- Unique and descriptive
- Visually persistent (not just placeholder)
- Programmatically connected to input
- Include input requirements

```jsx
// Good - uses FormItemInput
<FormItemInput
  id="vm-name"
  label="Virtual Machine Name"
  helpText="3-50 characters, alphanumeric only"
  required={true}
/>

// Good - manual connection
<label htmlFor="cpu-count">CPU Count</label>
<InputNumber id="cpu-count" min={1} max={128} />
```

### Error Messages

Error messages must be:
- Descriptive text (not just color/icon)
- Programmatically associated with input
- Provide suggestions for correction

```jsx
<FormItemInput
  id="email"
  label="Email Address"
  error={hasError}
  errorText="Please enter a valid email address (e.g., user@example.com)"
/>
```

### Form Sections

Group related fields with proper labeling:

```jsx
<FormLayout>
  <FormSection title="Network Configuration">
    <FormItemSelect id="vlan" label="VLAN" />
    <FormItemInput id="ip" label="IP Address" />
  </FormSection>
</FormLayout>
```

## Search and Filtering

When content updates dynamically, announce changes to screen readers:

```jsx
// Use ARIA live regions
<div aria-live="polite" aria-atomic="true">
  {`Showing ${results.length} results for "${searchTerm}"`}
</div>
```

## Modal Accessibility

### Focus Management

When modal opens:
- Focus first interactive element, OR
- Focus heading if content is critical, OR
- Focus non-destructive action for dangerous operations

When modal closes:
- Return focus to triggering element (`restoreFocus={true}`)

```jsx
<Modal
  visible={isOpen}
  title="Confirm Delete"
  onClose={handleClose}
  restoreFocus={true}
>
  ...
</Modal>
```

### Focus Trap

Modal automatically traps focus. For nested elements needing escape:

```jsx
<Modal visible={isOpen}>
  <Select
    getPopupContainer={() => modalRef.current}
    ...
  />
</Modal>
```

### Nested Modals

Confirm dialogs inside modals should also restore focus:

```jsx
<Modal visible={mainModal}>
  <ConfirmModal
    visible={confirmModal}
    restoreFocus={true}
  />
</Modal>
```

## Table Accessibility

### Row Selection

Provide clear indication of selection state:

```jsx
<Table
  rowSelection={{
    selected: selectedRows,
    onChange: handleSelectionChange
  }}
  dataSource={data}
/>
```

### Sortable Columns

Indicate sort state in column headers:

```jsx
const columns = [{
  title: 'Name',
  key: 'name',
  sorter: true,
  sortOrder: sortConfig.key === 'name' ? sortConfig.order : null
}];
```

## Tooltip Accessibility

Use new tooltip implementation for screen reader support:

```jsx
<Tooltip
  oldTooltip={false}
  content="Helpful information"
  id="tooltip-id"
>
  <span aria-describedby="tooltip-id">
    <StatusIcon type={StatusIcon.StatusIconTypes.INFO} />
  </span>
</Tooltip>
```

## Color and Contrast

- Don't rely on color alone to convey information
- Ensure sufficient color contrast (4.5:1 for normal text)
- Prism themes handle this automatically; use token colors

## Testing Checklist

Before deploying, verify:

- [ ] All buttons have descriptive labels
- [ ] All form inputs have associated labels
- [ ] All images/icons have alt text or aria-hidden
- [ ] Tab order is logical
- [ ] Focus is visible on all interactive elements
- [ ] Error messages are descriptive
- [ ] Color is not the only way to convey meaning
- [ ] Modal focus is properly managed
- [ ] Dynamic content updates are announced

## Resources

- [WCAG 2.1 Quick Reference](https://www.w3.org/WAI/WCAG22/quickref/?versions=2.1)
- [Prism Storybook - Accessibility](http://prism-styleguide/v2/#/Accessibility)
- Internal: #a11y Slack channel
