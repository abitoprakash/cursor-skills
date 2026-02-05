# Layout Components

Components for structuring and organizing UI content.

## FlexLayout

**Import:** `import { FlexLayout } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Structure?id=flexlayout

Flexbox-based layout container for horizontal arrangements.

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `flexDirection` | `string` | 'row', 'column', 'row-reverse', 'column-reverse' |
| `alignItems` | `string` | 'flex-start', 'center', 'flex-end', 'stretch', 'baseline' |
| `justifyContent` | `string` | 'flex-start', 'center', 'flex-end', 'space-between', 'space-around' |
| `itemSpacing` | `string` | Gap between items (e.g., '10px', '20px') |
| `itemGap` | `string` | Token-based gap: 'XS', 'S', 'M', 'L', 'XL' |
| `flexWrap` | `string` | 'wrap', 'nowrap' |
| `padding` | `string` | Container padding |
| `background` | `string` | Background context: 'base', 'alt', 'body' |

**Examples:**

```jsx
// Horizontal row with centered items
<FlexLayout alignItems="center" itemSpacing="10px">
  <Button>Action 1</Button>
  <Button>Action 2</Button>
</FlexLayout>

// Space between items
<FlexLayout justifyContent="space-between" alignItems="center">
  <Title size="h2">Section Title</Title>
  <Button>Add New</Button>
</FlexLayout>

// Vertical column
<FlexLayout flexDirection="column" itemSpacing="20px">
  <Paragraph>Item 1</Paragraph>
  <Paragraph>Item 2</Paragraph>
</FlexLayout>

// With background context
<FlexLayout background="alt" padding="20px">
  <Button type={Button.ButtonTypes.SECONDARY}>Cancel</Button>
</FlexLayout>
```

---

## FlexItem

**Import:** `import { FlexItem } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Structure?id=flexitem

Child component for FlexLayout with flex properties.

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `flex` | `string` | Flex grow/shrink/basis |
| `alignSelf` | `string` | Override parent alignment |

---

## StackingLayout

**Import:** `import { StackingLayout } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Structure?id=stackinglayout

Vertical stacking layout container.

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `itemSpacing` | `string` | Gap between stacked items |
| `itemGap` | `string` | Token-based gap: 'S', 'M', 'L' |
| `padding` | `string` | Container padding |
| `background` | `string` | Background context |

**Examples:**

```jsx
// Basic vertical stack
<StackingLayout itemSpacing="20px">
  <Title size="h2">Page Title</Title>
  <Paragraph>Description text here.</Paragraph>
  <Button>Action</Button>
</StackingLayout>

// With background
<StackingLayout background="base" padding="20px" itemSpacing="10px">
  <FormItemInput label="Name" id="name" />
  <FormItemInput label="Email" id="email" />
</StackingLayout>
```

---

## ContainerLayout

**Import:** `import { ContainerLayout } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Structure?id=containerlayout

Container with padding, border, and background options.

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `padding` | `string` | Inner padding |
| `backgroundColor` | `string` | 'white', 'gray', 'dark' |
| `border` | `boolean` | Show border |

**Example:**

```jsx
<ContainerLayout padding="20px" backgroundColor="white" border={true}>
  <Title size="h3">Card Title</Title>
  <Paragraph>Card content goes here.</Paragraph>
</ContainerLayout>
```

---

## Divider

**Import:** `import { Divider } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Structure?id=divider

Horizontal dividing line.

**Example:**

```jsx
<StackingLayout>
  <Paragraph>Section 1</Paragraph>
  <Divider />
  <Paragraph>Section 2</Paragraph>
</StackingLayout>
```

---

## Separator / VerticalSeparator

**Import:** `import { Separator, VerticalSeparator } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Structure?id=separator

Separators for visual division.

---

## SidePanel

**Import:** `import { SidePanel } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Structure?id=sidepanel

Sliding panel from screen edge.

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `visible` | `boolean` | Panel visibility |
| `onClose` | `function` | Close handler |
| `position` | `string` | 'left' or 'right' |
| `width` | `string` | Panel width |
| `title` | `string` | Panel title |

**Example:**

```jsx
<SidePanel
  visible={isPanelOpen}
  onClose={() => setIsPanelOpen(false)}
  position="right"
  width="400px"
  title="Details"
>
  <StackingLayout padding="20px">
    <Paragraph>Panel content here</Paragraph>
  </StackingLayout>
</SidePanel>
```

---

## Accordion

**Import:** `import { Accordion } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Structure?id=accordion

Collapsible content sections.

**Example:**

```jsx
<Accordion defaultActiveKey={['1']}>
  <Accordion.Panel header="Section 1" key="1">
    Content for section 1
  </Accordion.Panel>
  <Accordion.Panel header="Section 2" key="2">
    Content for section 2
  </Accordion.Panel>
</Accordion>
```

---

## Overlay

**Import:** `import { Overlay } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Structure?id=overlay

Background overlay/backdrop.

---

## HeaderFooterLayout

**Import:** `import { HeaderFooterLayout } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Structure?id=headerfooterlayout

Layout with fixed header, scrollable content, and fixed footer.

---

## MainPageLayout

**Import:** `import { MainPageLayout } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Structure?id=mainpagelayout

Main page structure with navigation and content areas.

---

## LeftNavLayout

**Import:** `import { LeftNavLayout } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Structure?id=leftnavlayout

Layout with left navigation sidebar.

---

## Popover

**Import:** `import { Popover } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Sessions?id=popover

Floating panel attached to trigger element.

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `content` | `ReactNode` | Popover content |
| `visible` | `boolean` | Controlled visibility |
| `onVisibleChange` | `function` | Visibility change handler |
| `placement` | `string` | Position relative to trigger |
| `trigger` | `string` | 'click' or 'hover' |
| `oldPopover` | `boolean` | Set to `false` for new version |

**Example:**

```jsx
<Popover
  oldPopover={false}
  content={
    <StackingLayout padding="10px">
      <Title size="h4">More Info</Title>
      <Paragraph>Detailed information here.</Paragraph>
    </StackingLayout>
  }
  trigger="click"
>
  <Button>Show Info</Button>
</Popover>
```
