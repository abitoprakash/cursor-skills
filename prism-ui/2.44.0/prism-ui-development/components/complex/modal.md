# Modal Component - Detailed Documentation

Modal dialogs for focused user interactions, confirmations, and forms.

**Storybook:** http://prism-styleguide/v2/#/Layouts/Sessions?id=modal

## Import

```jsx
import { 
  Modal, 
  ModalContent, 
  ModalWrap, 
  ModalHeader,
  ConfirmModal,
  FullPageModal 
} from '@nutanix-ui/prism-reactjs';
```

## Basic Usage

```jsx
const [visible, setVisible] = useState(false);

<Button onClick={() => setVisible(true)}>Open Modal</Button>

<Modal
  visible={visible}
  title="Modal Title"
  onClose={() => setVisible(false)}
  primaryButtonOnClick={() => {
    handleSave();
    setVisible(false);
  }}
>
  <StackingLayout padding="20px">
    <Paragraph>Modal content goes here.</Paragraph>
  </StackingLayout>
</Modal>
```

## Props Reference

### Modal Props

| Prop | Type | Description |
|------|------|-------------|
| `visible` | `boolean` | Controls visibility |
| `title` | `string/ReactNode` | Modal title |
| `onClose` | `function` | Close handler |
| `width` | `string` | Modal width (default: 520px) |
| `height` | `string` | Fixed height |
| `footer` | `ReactNode/boolean` | Custom footer, or false to hide |
| `headerActions` | `ReactNode` | Actions in header (close button area) |
| `closeOnEscape` | `boolean` | Close on Escape key |
| `restoreFocus` | `boolean` | Return focus to trigger on close |
| `unmountOnClose` | `boolean` | Unmount children when closed |
| `primaryButtonOnClick` | `function` | Primary button handler |
| `primaryButtonLabel` | `string` | Primary button text (default: "Save") |
| `closeButtonProps` | `object` | Props for close button |

## Focus Management (Accessibility)

### When Modal Opens

Focus should go to:
1. **First interactive element** (most common)
2. **Heading** if content is critical to understand
3. **Non-destructive action** for dangerous operations

```jsx
// Custom focus on open
const resetBtnRef = useRef(null);

<Modal
  visible={visible}
  onVisibleChange={(isVisible) => {
    if (isVisible && resetBtnRef.current) {
      resetBtnRef.current.focus();
    }
  }}
  footer={
    <FlexLayout itemSpacing="10px" justifyContent="flex-end">
      <Button innerRef={resetBtnRef} type="secondary">Reset</Button>
      <Button>Save</Button>
    </FlexLayout>
  }
>
  ...
</Modal>
```

### When Modal Closes

Always restore focus to the triggering element:

```jsx
<Modal
  visible={visible}
  restoreFocus={true}  // Important for accessibility
  onClose={handleClose}
>
  ...
</Modal>
```

### Focus on Non-Interactive Element

For critical content that should be read first:

```jsx
<Modal
  visible={visible}
  title={
    <span tabIndex={-1} ref={titleRef}>
      Important Warning
    </span>
  }
  onVisibleChange={(isVisible) => {
    if (isVisible) {
      titleRef.current?.focus();
    }
  }}
>
  ...
</Modal>
```

## Custom Footer

```jsx
<Modal
  visible={visible}
  title="Create VM"
  onClose={handleClose}
  footer={
    <FlexLayout itemSpacing="10px" justifyContent="flex-end">
      <Button type={Button.ButtonTypes.SECONDARY} onClick={handleClose}>
        Cancel
      </Button>
      <Button type={Button.ButtonTypes.PRIMARY} onClick={handleSave}>
        Create
      </Button>
    </FlexLayout>
  }
>
  <FormLayout>
    <FormItemInput id="name" label="Name" />
  </FormLayout>
</Modal>
```

## No Footer

```jsx
<Modal
  visible={visible}
  title="Information"
  footer={false}
  onClose={handleClose}
>
  <StackingLayout padding="20px">
    <Paragraph>Read-only information content.</Paragraph>
  </StackingLayout>
</Modal>
```

## Header Actions

```jsx
<Modal
  visible={visible}
  title="Settings"
  headerActions={[
    <Link key="help" type="secondary" href="/help">
      <QuestionIcon />
    </Link>,
    <Button
      key="close"
      onClick={handleClose}
      type={Button.ButtonTypes.ICON_SECONDARY}
    >
      <CloseIcon />
    </Button>
  ]}
>
  ...
</Modal>
```

## Modal with Form

```jsx
<Modal
  visible={visible}
  title="Create Virtual Machine"
  width="600px"
  onClose={handleClose}
  footer={
    <FlexLayout itemSpacing="10px" justifyContent="flex-end">
      <Button type="secondary" onClick={handleClose}>Cancel</Button>
      <Button onClick={handleSubmit} disabled={!isValid}>Create</Button>
    </FlexLayout>
  }
>
  <Form>
    <FormLayout>
      <FormSection title="Basic Configuration">
        <FormItemInput
          id="vm-name"
          label="VM Name"
          value={name}
          onChange={(e) => setName(e.target.value)}
          required
        />
        <FormItemSelect
          id="cluster"
          label="Cluster"
          rowsData={clusters}
          selectedRow={selectedCluster}
          onSelectedChange={setSelectedCluster}
          required
        />
      </FormSection>
    </FormLayout>
  </Form>
</Modal>
```

## Modal with Table

When using dropdowns inside modal, mount to modal body:

```jsx
const modalRef = useRef(null);

<Modal
  visible={visible}
  modalWrapRef={modalRef}
  title="Select Items"
>
  <Table
    columns={columns}
    dataSource={data}
    rowAction={{
      actions: [...],
      getPopupContainer: () => modalRef.current
    }}
  />
</Modal>
```

## Scrollable Content

```jsx
<Modal
  visible={visible}
  title="Long Content"
  contentProps={{
    bodyProps: {
      style: {
        maxHeight: '400px',
        overflow: 'auto'
      }
    }
  }}
>
  <StackingLayout padding="20px">
    {/* Long content */}
  </StackingLayout>
</Modal>
```

## ConfirmModal

Simple confirmation dialogs:

```jsx
<ConfirmModal
  visible={confirmVisible}
  onConfirm={() => {
    handleDelete();
    setConfirmVisible(false);
  }}
  onCancel={() => setConfirmVisible(false)}
  restoreFocus={true}
>
  Are you sure you want to delete this item? This action cannot be undone.
</ConfirmModal>
```

### Custom Confirm Footer

```jsx
<ConfirmModal
  visible={confirmVisible}
  onCancel={handleCancel}
  footer={[
    <Button key="cancel" type="secondary" onClick={handleCancel}>
      Cancel
    </Button>,
    <Button key="confirm" type="destructive" onClick={handleConfirm}>
      Delete
    </Button>
  ]}
>
  Are you sure?
</ConfirmModal>
```

## Nested Modals

When using confirmation inside another modal:

```jsx
<Modal visible={mainVisible}>
  <StackingLayout padding="20px">
    <Paragraph>Main modal content</Paragraph>
    <Button onClick={() => setConfirmVisible(true)}>
      Open Confirm
    </Button>
  </StackingLayout>
  
  <ConfirmModal
    visible={confirmVisible}
    onCancel={() => setConfirmVisible(false)}
    onConfirm={handleConfirm}
    restoreFocus={true}  // Returns focus within parent modal
  >
    Confirm this action?
  </ConfirmModal>
</Modal>
```

## FullPageModal

For complex workflows requiring full screen:

```jsx
<FullPageModal
  visible={visible}
  title="VM Configuration Wizard"
  onClose={handleClose}
>
  <Steps current={step}>
    <StepItem title="Basic Info" />
    <StepItem title="Resources" />
    <StepItem title="Network" />
    <StepItem title="Review" />
  </Steps>
  {/* Step content */}
</FullPageModal>
```

## Close on Escape with Warning

```jsx
const [visible, setVisible] = useState(false);
const [warningVisible, setWarningVisible] = useState(false);
const [hasChanges, setHasChanges] = useState(false);

const handleClose = () => {
  if (hasChanges) {
    setWarningVisible(true);
  } else {
    setVisible(false);
  }
};

<Modal
  visible={visible}
  closeOnEscape={true}
  onClose={handleClose}
>
  <FormItemInput 
    value={value}
    onChange={(e) => {
      setValue(e.target.value);
      setHasChanges(true);
    }}
  />
</Modal>

<ConfirmModal
  visible={warningVisible}
  onCancel={() => setWarningVisible(false)}
  onConfirm={() => {
    setWarningVisible(false);
    setVisible(false);
    setHasChanges(false);
  }}
>
  You have unsaved changes. Discard them?
</ConfirmModal>
```

## Expandable Modal

Keep modal centered when content changes height:

```jsx
<Modal
  visible={visible}
  height="310px"  // Set to expanded height
>
  <StackingLayout padding="20px">
    <Paragraph>Initial content</Paragraph>
    <Button onClick={() => setExpanded(!expanded)}>
      {expanded ? 'Collapse' : 'Expand'}
    </Button>
    {expanded && <Paragraph>Additional content</Paragraph>}
  </StackingLayout>
</Modal>
```

## Tooltips Inside Modal

Mount tooltips to modal for proper screen reader support:

```jsx
const modalRef = useRef(null);

<Modal visible={visible} modalWrapRef={modalRef}>
  <Tooltip
    oldTooltip={false}
    content="Helpful information"
    mountElement={() => modalRef.current}
  >
    <StatusIcon type={StatusIcon.StatusIconTypes.INFO} />
  </Tooltip>
</Modal>
```

## Accessibility Checklist

- [ ] `restoreFocus={true}` is set
- [ ] Modal has a descriptive `title`
- [ ] Focus moves to appropriate element on open
- [ ] Escape key closes modal (if appropriate)
- [ ] Destructive actions have non-destructive default focus
- [ ] Dropdowns/popups mount to modal body
- [ ] Content is accessible via keyboard
