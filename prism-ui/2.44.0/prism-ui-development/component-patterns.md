# Component Visual Patterns Guide

This guide helps identify which Prism UI components to use based on visual patterns in Figma designs or screenshots.

## Layout Patterns

### Horizontal Row Layout
**Visual:** Items arranged horizontally in a row
**Component:** `FlexLayout`

```jsx
<FlexLayout alignItems="center" itemSpacing="10px">
  <Button>Action 1</Button>
  <Button type={Button.ButtonTypes.SECONDARY}>Action 2</Button>
</FlexLayout>
```

### Vertical Stack Layout
**Visual:** Items stacked vertically with consistent spacing
**Component:** `StackingLayout`

```jsx
<StackingLayout itemSpacing="20px">
  <Title>Section Title</Title>
  <Paragraph>Content goes here</Paragraph>
  <Button>Action</Button>
</StackingLayout>
```

### Content Container
**Visual:** Boxed area with padding, possibly with border or background
**Component:** `ContainerLayout`

```jsx
<ContainerLayout padding="20px" backgroundColor="white" border={true}>
  {/* content */}
</ContainerLayout>
```

### Page Layout with Sidebar
**Visual:** Main content with navigation sidebar
**Component:** `LeftNavLayout`, `MainPageLayout`

### Header + Content + Footer
**Visual:** Fixed header, scrollable content, fixed footer
**Component:** `HeaderFooterLayout`

## Action Patterns

### Primary Action Button
**Visual:** Solid blue/colored button, prominent
**Component:** `Button` with `type={Button.ButtonTypes.PRIMARY}`

### Secondary Action Button
**Visual:** Outlined or less prominent button
**Component:** `Button` with `type={Button.ButtonTypes.SECONDARY}`

### Destructive Action Button
**Visual:** Red/warning colored button for dangerous actions
**Component:** `Button` with `type={Button.ButtonTypes.DESTRUCTIVE}`

### Icon-Only Button
**Visual:** Button with just an icon (no text)
**Component:** `Button` with icon child and `aria-label`

```jsx
<Button aria-label="Delete item" type={Button.ButtonTypes.SECONDARY}>
  <CloseIcon aria-hidden="true" />
</Button>
```

### Button with Dropdown
**Visual:** Button with chevron that opens a menu
**Component:** `Button` + `Dropdown` + `Menu`

```jsx
<Dropdown popup={<Menu>...</Menu>}>
  <Button>
    Actions <ChevronDownIcon aria-hidden="true" />
  </Button>
</Dropdown>
```

### Split Button
**Visual:** Button split into main action and dropdown trigger
**Component:** `ButtonGroup` + `Button` + `Dropdown`

```jsx
<ButtonGroup>
  <Button>Save</Button>
  <Dropdown popup={menu}>
    <Button aria-label="More save options">
      <ChevronDownIcon aria-hidden="true" />
    </Button>
  </Dropdown>
</ButtonGroup>
```

## Form Patterns

### Text Input with Label
**Visual:** Label above input field, possibly with help text
**Component:** `FormItemInput`

```jsx
<FormItemInput
  id="name"
  label="Name"
  helpText="Enter your full name"
  placeholder="John Doe"
/>
```

### Password Input
**Visual:** Input with masked characters and show/hide toggle
**Component:** `FormItemInputPassword` or `InputPassword`

### Number Input with Stepper
**Visual:** Input with up/down arrows for numeric values
**Component:** `InputNumber`

### Dropdown Selection
**Visual:** Input that opens a list of options
**Component:** `Select` or `FormItemSelect`

```jsx
<FormItemSelect
  id="cluster"
  label="Select Cluster"
  rowsData={[
    { key: '1', label: 'Cluster A' },
    { key: '2', label: 'Cluster B' }
  ]}
/>
```

### Multi-Selection
**Visual:** Dropdown allowing multiple selections with tags
**Component:** `MultiSelect` or `MultiSelectInput`

### Checkbox
**Visual:** Square box with checkmark
**Component:** `Checkbox`

### Toggle Switch
**Visual:** On/off slider control
**Component:** `Checkbox` with `type={Checkbox.CheckboxTypes.TOGGLE}`

### Radio Group
**Visual:** Circular buttons where only one can be selected
**Component:** `RadioGroup` + `Radio`

```jsx
<RadioGroup selectedValue={value} onChange={setValue}>
  <Radio value="opt1">Option 1</Radio>
  <Radio value="opt2">Option 2</Radio>
</RadioGroup>
```

### Date Picker
**Visual:** Input that opens a calendar
**Component:** `DatePicker` or `FormItemDatePicker`

### Time Picker
**Visual:** Input for time selection
**Component:** `TimePicker` or `FormItemTimePicker`

### Slider
**Visual:** Draggable track for range selection
**Component:** `Slider`

### Text Area
**Visual:** Multi-line text input
**Component:** `TextArea` or `FormItemTextArea`

### Form Sections
**Visual:** Grouped form fields with section title
**Component:** `FormSection` inside `FormLayout`

```jsx
<FormLayout>
  <FormSection title="General Settings">
    <FormItemInput id="name" label="Name" />
  </FormSection>
  <FormSection title="Advanced Settings">
    <FormItemSelect id="type" label="Type" />
  </FormSection>
</FormLayout>
```

## Data Display Patterns

### Data Table
**Visual:** Grid with headers, rows, possibly sortable/selectable
**Component:** `Table` or `LocalTable`

### Editable Table
**Visual:** Table with inline editing capability
**Component:** `Table` with `editRow` prop

### Simple List
**Visual:** Bulleted or numbered list
**Component:** `UnorderedList` or `OrderedList`

### Badge/Tag
**Visual:** Small label showing status or count
**Component:** `Badge`

```jsx
<Badge color="green" count="Active" />
<Badge count={5} />
```

### Status Indicator
**Visual:** Colored dot/icon showing status
**Component:** `StatusIcon`

```jsx
<StatusIcon type={StatusIcon.StatusIconTypes.SUCCESS} />
<StatusIcon type={StatusIcon.StatusIconTypes.WARNING} />
<StatusIcon type={StatusIcon.StatusIconTypes.ERROR} />
```

### Progress Bar
**Visual:** Horizontal bar showing completion percentage
**Component:** `Progress`

### Loading Spinner
**Visual:** Spinning indicator during async operations
**Component:** `Loader`

```jsx
<Loader loading={isLoading} tip="Loading...">
  {/* content */}
</Loader>
```

### Alert Banner
**Visual:** Colored banner with message (info/warning/error)
**Component:** `Alert`

```jsx
<Alert
  type={Alert.AlertTypes.WARNING}
  message="Please review before proceeding"
/>
```

### Tooltip
**Visual:** Hover-triggered popup with information
**Component:** `Tooltip`

```jsx
<Tooltip content="Additional information" oldTooltip={false}>
  <StatusIcon type={StatusIcon.StatusIconTypes.INFO} />
</Tooltip>
```

## Navigation Patterns

### Tab Navigation
**Visual:** Horizontal tabs for switching views
**Component:** `Tabs` + `TabItem`

```jsx
<Tabs activeKey={activeTab} onTabClick={setActiveTab}>
  <TabItem tabKey="overview" title="Overview">Content 1</TabItem>
  <TabItem tabKey="details" title="Details">Content 2</TabItem>
</Tabs>
```

### Vertical Menu
**Visual:** Sidebar navigation with items
**Component:** `Menu` + `MenuItem`

### Breadcrumb
**Visual:** Path showing navigation hierarchy
**Component:** `Breadcrumb` + `BreadcrumbItem`

```jsx
<Breadcrumb>
  <BreadcrumbItem href="/">Home</BreadcrumbItem>
  <BreadcrumbItem href="/vms">VMs</BreadcrumbItem>
  <BreadcrumbItem>VM Details</BreadcrumbItem>
</Breadcrumb>
```

### Step Wizard
**Visual:** Multi-step process indicator
**Component:** `Steps` + `StepItem`

### Pagination
**Visual:** Page numbers for navigating large datasets
**Component:** `Pagination`

## Overlay Patterns

### Modal Dialog
**Visual:** Centered overlay with content and actions
**Component:** `Modal`

```jsx
<Modal
  visible={isOpen}
  title="Confirm Action"
  onClose={handleClose}
  footer={<Button onClick={handleConfirm}>Confirm</Button>}
>
  <Paragraph>Are you sure?</Paragraph>
</Modal>
```

### Confirmation Dialog
**Visual:** Simple yes/no confirmation modal
**Component:** `ConfirmModal`

### Full Page Modal
**Visual:** Modal covering entire screen
**Component:** `FullPageModal`

### Side Panel
**Visual:** Sliding panel from edge of screen
**Component:** `SidePanel`

### Popover
**Visual:** Small floating panel attached to trigger element
**Component:** `Popover`

## Typography Patterns

### Page Title
**Visual:** Large heading text
**Component:** `Title` with `size="h1"` or `size="h2"`

### Section Heading
**Visual:** Medium heading for sections
**Component:** `Title` with `size="h3"` or `size="h4"`

### Body Text
**Visual:** Normal paragraph text
**Component:** `Paragraph`

### Small Label
**Visual:** Small descriptive text
**Component:** `TextLabel`

### Link
**Visual:** Clickable text, possibly with icon
**Component:** `Link`

```jsx
<Link href="/details">View Details</Link>
<Link type="with-icon" icon={<ExternalLinkIcon />}>
  Open in new tab
</Link>
```

## Icon Usage

Icons should be imported individually from `@nutanix-ui/prism-reactjs`:

```jsx
import { PlusIcon, EditIcon, CloseIcon } from '@nutanix-ui/prism-reactjs';
```

Common icon patterns:
- **Add actions:** `PlusIcon`, `PlusCircleIcon`
- **Edit actions:** `EditIcon`
- **Delete actions:** `CloseIcon`, `RemoveIcon`
- **Navigation:** `ChevronDownIcon`, `ChevronRightIcon`, `ChevronLeftIcon`
- **Status:** `SuccessStatusIcon`, `WarningStatusIcon`, `ErrorSquareIcon`
- **Info:** `InformationSquareIcon`, `QuestionIcon`

Always add `aria-hidden="true"` to decorative icons.
