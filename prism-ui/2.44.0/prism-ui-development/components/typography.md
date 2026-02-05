# Typography Components

Components for text content and headings.

## Title

**Import:** `import { Title } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Typography?id=title

Heading component for titles and section headers.

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `size` | `string` | 'h1', 'h2', 'h3', 'h4' |
| `tag` | `string` | HTML tag to use (defaults to size) |
| `appearance` | `TitleAppearance` | DEFAULT or NAVIGATION |

**Examples:**

```jsx
// Page title
<Title size="h1">Virtual Machines</Title>

// Section heading
<Title size="h2">Network Configuration</Title>

// Subsection
<Title size="h3">IP Settings</Title>

// Small heading
<Title size="h4">Advanced Options</Title>

// Use different tag than visual size
<Title size="h2" tag="span">Section Title</Title>
```

**Accessibility Note:**
- Use headings in sequential order (h1 → h2 → h3)
- Don't skip heading levels
- Screen readers use headings for navigation

---

## Paragraph

**Import:** `import { Paragraph } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Typography?id=paragraph

Body text component.

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `type` | `string` | 'primary' (default) or 'secondary' |
| `forceMultiLineHeight` | `boolean` | Consistent line height for single lines |

**Examples:**

```jsx
// Primary text
<Paragraph>
  This is the main body text. Use it for descriptions, 
  instructions, and general content.
</Paragraph>

// Secondary text (lighter/smaller)
<Paragraph type="secondary">
  Additional information or less important text.
</Paragraph>
```

---

## TextLabel

**Import:** `import { TextLabel } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Typography?id=textlabel

Small text labels.

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `type` | `TEXT_LABEL_TYPE` | PRIMARY, SECONDARY, INFO |
| `size` | `TEXT_LABEL_SIZE` | SMALL, MEDIUM, LARGE |

**Examples:**

```jsx
// Small label
<TextLabel size={TextLabel.TEXT_LABEL_SIZE.SMALL}>
  Last updated: 5 minutes ago
</TextLabel>

// Primary label
<TextLabel type={TextLabel.TEXT_LABEL_TYPE.PRIMARY}>
  Status
</TextLabel>

// Info label
<TextLabel type={TextLabel.TEXT_LABEL_TYPE.INFO}>
  Helpful tip text
</TextLabel>
```

---

## Link

**Import:** `import { Link } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Typography?id=link

Hyperlink component with various styles.

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `href` | `string` | Link URL |
| `type` | `string` | 'default', 'inline', 'with-icon', 'secondary' |
| `icon` | `ReactNode` | Icon for 'with-icon' type |
| `target` | `string` | Link target ('_blank' for new tab) |
| `onClick` | `function` | Click handler |

**Examples:**

```jsx
// Default link
<Link href="/details">View Details</Link>

// Inline link (within text)
<Paragraph>
  For more information, see the <Link type="inline" href="/docs">documentation</Link>.
</Paragraph>

// Link with icon
<Link type="with-icon" icon={<ExternalLinkIcon />} href="https://example.com">
  External Resource
</Link>

// Add item link
<Link type="with-icon" icon={<PlusIcon size="small" />}>
  Add New Item
</Link>

// Secondary link
<Link type="secondary" href="/help">
  Need Help?
</Link>
```

---

## Text Composition Examples

```jsx
// Page header
<StackingLayout itemSpacing="10px">
  <FlexLayout justifyContent="space-between" alignItems="center">
    <Title size="h1">Infrastructure</Title>
    <Button>Create Resource</Button>
  </FlexLayout>
  <Paragraph type="secondary">
    Manage your virtual infrastructure including VMs, networks, and storage.
  </Paragraph>
</StackingLayout>

// Section with description
<StackingLayout itemSpacing="15px">
  <Title size="h2">Network Settings</Title>
  <Paragraph>
    Configure the network settings for this virtual machine. 
    Each network interface connects to a specific subnet.
  </Paragraph>
</StackingLayout>

// Info card
<ContainerLayout padding="20px" border={true}>
  <StackingLayout itemSpacing="10px">
    <Title size="h3">Quick Stats</Title>
    <FlexLayout itemSpacing="20px">
      <div>
        <TextLabel type={TextLabel.TEXT_LABEL_TYPE.SECONDARY}>Total VMs</TextLabel>
        <Title size="h2">42</Title>
      </div>
      <div>
        <TextLabel type={TextLabel.TEXT_LABEL_TYPE.SECONDARY}>Running</TextLabel>
        <Title size="h2">38</Title>
      </div>
    </FlexLayout>
  </StackingLayout>
</ContainerLayout>
```
