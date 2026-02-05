# Select Components - Detailed Documentation

Components for single and multiple selection.

**Storybook:** http://prism-styleguide/v2/#/Components/Data%20Input?id=select

## Import

```jsx
import { 
  Select,
  MultiSelect,
  MultiSelectInput,
  SelectDropdown,
  FormItemSelect
} from '@nutanix-ui/prism-reactjs';
```

## Select - Basic Usage

```jsx
const [selectedRow, setSelectedRow] = useState(null);

const options = [
  { key: 'opt1', label: 'Option 1' },
  { key: 'opt2', label: 'Option 2' },
  { key: 'opt3', label: 'Option 3' }
];

<Select
  label="Choose an option"
  rowsData={options}
  selectedRow={selectedRow}
  onSelectedChange={setSelectedRow}
/>
```

## Select Props Reference

| Prop | Type | Description |
|------|------|-------------|
| `label` | `string` | Input label |
| `rowsData` | `array` | Options array |
| `selectedRow` | `object` | Currently selected option |
| `onSelectedChange` | `function` | Selection change handler |
| `placeholder` | `string` | Placeholder text |
| `searchable` | `boolean` | Enable search/filter |
| `clearable` | `boolean` | Show clear button |
| `disabled` | `boolean` | Disabled state |
| `error` | `boolean` | Error state |
| `errorText` | `string` | Error message |
| `getPopupContainer` | `function` | Where to mount dropdown |
| `dropdownProps` | `object` | Props passed to dropdown |

## Options Data Structure

### Basic Options

```jsx
const options = [
  { key: 'unique-id-1', label: 'Display Text 1' },
  { key: 'unique-id-2', label: 'Display Text 2' }
];
```

### With Disabled Option

```jsx
const options = [
  { key: 'opt1', label: 'Available' },
  { key: 'opt2', label: 'Unavailable', disabled: true }
];
```

### Nested Options (Groups)

```jsx
const options = [
  {
    key: 'group1',
    label: 'Production',
    children: [
      { key: 'prod-1', label: 'Prod Cluster 1' },
      { key: 'prod-2', label: 'Prod Cluster 2' }
    ]
  },
  {
    key: 'group2',
    label: 'Development',
    children: [
      { key: 'dev-1', label: 'Dev Cluster 1' }
    ]
  }
];
```

## Searchable Select

```jsx
<Select
  label="Search Clusters"
  rowsData={clusterOptions}
  selectedRow={selectedCluster}
  onSelectedChange={setSelectedCluster}
  searchable={true}
  placeholder="Search by name..."
/>
```

## Select with Custom Render

```jsx
const options = [
  { 
    key: 'vm1', 
    label: 'VM-001',
    status: 'running',
    cpu: 4
  },
  // ...
];

<Select
  label="Select VM"
  rowsData={options}
  selectedRow={selectedVM}
  onSelectedChange={setSelectedVM}
  renderOption={(option) => (
    <FlexLayout alignItems="center" itemSpacing="10px">
      <StatusIcon 
        type={option.status === 'running' 
          ? StatusIcon.StatusIconTypes.SUCCESS 
          : StatusIcon.StatusIconTypes.WARNING
        }
      />
      <span>{option.label}</span>
      <TextLabel type="secondary">{option.cpu} vCPUs</TextLabel>
    </FlexLayout>
  )}
/>
```

## FormItemSelect

Select with integrated label and validation:

```jsx
<FormItemSelect
  id="cluster-select"
  label="Target Cluster"
  rowsData={clusterOptions}
  selectedRow={selectedCluster}
  onSelectedChange={setSelectedCluster}
  required={true}
  error={!selectedCluster}
  errorText="Please select a cluster"
  helpText="Choose the cluster where the VM will be created"
/>
```

## MultiSelect

For multiple selections:

```jsx
const [selectedRows, setSelectedRows] = useState([]);

<MultiSelect
  label="Select Tags"
  rowsData={tagOptions}
  selectedRows={selectedRows}
  onSelectedChange={setSelectedRows}
  placeholder="Choose tags..."
/>
```

### MultiSelect Props

| Prop | Type | Description |
|------|------|-------------|
| `rowsData` | `array` | Options array |
| `selectedRows` | `array` | Selected options |
| `onSelectedChange` | `function` | Selection change handler |
| `maxTagCount` | `number` | Max tags to display |
| `maxTagTextLength` | `number` | Max text length per tag |

## MultiSelectInput

Input field with multiple values as tags:

```jsx
const [values, setValues] = useState([]);

<MultiSelectInput
  label="IP Addresses"
  value={values}
  onChange={setValues}
  placeholder="Enter IP addresses"
/>
```

## Select in Modal

When using Select inside a Modal, mount dropdown to modal:

```jsx
const modalRef = useRef(null);

<Modal visible={visible} modalWrapRef={modalRef}>
  <Select
    label="Cluster"
    rowsData={options}
    selectedRow={selected}
    onSelectedChange={setSelected}
    getPopupContainer={() => modalRef.current}
  />
</Modal>
```

## Select in Table

```jsx
const columns = [
  {
    title: 'Status',
    key: 'status',
    render: (status, record) => (
      <Select
        rowsData={statusOptions}
        selectedRow={statusOptions.find(s => s.key === status)}
        onSelectedChange={(newStatus) => handleStatusChange(record.key, newStatus)}
        getPopupContainer={() => document.body}
      />
    )
  }
];
```

## Controlled vs Uncontrolled

### Controlled (Recommended)

```jsx
const [selected, setSelected] = useState(null);

<Select
  rowsData={options}
  selectedRow={selected}
  onSelectedChange={setSelected}
/>
```

### With Default Value

```jsx
<Select
  rowsData={options}
  selectedRow={options[0]}  // Default to first option
  onSelectedChange={setSelected}
/>
```

## Dropdown Customization

```jsx
<Select
  rowsData={options}
  selectedRow={selected}
  onSelectedChange={setSelected}
  dropdownProps={{
    showCustomScrollbar: false,
    maxHeight: '300px'
  }}
/>
```

## Accessibility

### Keyboard Navigation

- **Tab**: Focus select
- **Enter/Space**: Open dropdown
- **Arrow Up/Down**: Navigate options
- **Enter**: Select option
- **Escape**: Close dropdown

### Screen Reader Support

- Use descriptive `label` prop
- Error messages are announced
- Selected value is announced

### ARIA Attributes

The Select component automatically adds appropriate ARIA attributes:
- `aria-haspopup="listbox"`
- `aria-expanded`
- `aria-labelledby`

## Complete Example

```jsx
import React, { useState, useRef } from 'react';
import { 
  Modal, 
  Form, 
  FormLayout, 
  FormSection,
  FormItemSelect,
  Select,
  MultiSelect,
  Button,
  FlexLayout
} from '@nutanix-ui/prism-reactjs';

function VMConfigModal({ visible, onClose }) {
  const modalRef = useRef(null);
  const [cluster, setCluster] = useState(null);
  const [network, setNetwork] = useState(null);
  const [tags, setTags] = useState([]);

  const clusterOptions = [
    { key: 'prod', label: 'Production Cluster' },
    { key: 'dev', label: 'Development Cluster' }
  ];

  const networkOptions = [
    { key: 'vlan10', label: 'VLAN 10 - Production' },
    { key: 'vlan20', label: 'VLAN 20 - Development' }
  ];

  const tagOptions = [
    { key: 'web', label: 'Web Server' },
    { key: 'db', label: 'Database' },
    { key: 'cache', label: 'Cache' }
  ];

  return (
    <Modal
      visible={visible}
      modalWrapRef={modalRef}
      title="VM Configuration"
      onClose={onClose}
      footer={
        <FlexLayout justifyContent="flex-end" itemSpacing="10px">
          <Button type="secondary" onClick={onClose}>Cancel</Button>
          <Button disabled={!cluster || !network}>Create</Button>
        </FlexLayout>
      }
    >
      <Form>
        <FormLayout>
          <FormSection title="Infrastructure">
            <FormItemSelect
              id="cluster"
              label="Cluster"
              rowsData={clusterOptions}
              selectedRow={cluster}
              onSelectedChange={setCluster}
              required
              getPopupContainer={() => modalRef.current}
            />
            <FormItemSelect
              id="network"
              label="Network"
              rowsData={networkOptions}
              selectedRow={network}
              onSelectedChange={setNetwork}
              required
              getPopupContainer={() => modalRef.current}
            />
          </FormSection>
          
          <FormSection title="Metadata">
            <MultiSelect
              label="Tags"
              rowsData={tagOptions}
              selectedRows={tags}
              onSelectedChange={setTags}
              getPopupContainer={() => modalRef.current}
            />
          </FormSection>
        </FormLayout>
      </Form>
    </Modal>
  );
}
```
