# Form Components

Components for building forms with proper labels and validation.

## Form

**Import:** `import { Form } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Form?id=form

Container component for form elements. Wraps form content and provides context.

**Example:**

```jsx
<Form>
  <FormLayout>
    <FormSection title="General">
      <FormItemInput id="name" label="Name" />
    </FormSection>
  </FormLayout>
</Form>
```

---

## FormLayout

**Import:** `import { FormLayout } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Structure?id=formlayout

Layout component that structures form sections.

---

## FormSection

**Import:** `import { FormSection } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Form?id=formsection

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `title` | `string` | Section title |
| `background` | `string` | Background variant: 'base', 'alt' |
| `padding` | `string` | Padding value |

**Example:**

```jsx
<FormSection title="Network Configuration">
  <FormItemInput id="ip" label="IP Address" />
  <FormItemSelect id="vlan" label="VLAN" rowsData={vlanOptions} />
</FormSection>
```

---

## FormItemInput

**Import:** `import { FormItemInput } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Form?id=formiteminput

Input with integrated label, help text, and error handling.

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `id` | `string` | Unique identifier (required for a11y) |
| `label` | `string` | Input label |
| `value` | `string` | Input value |
| `onChange` | `function` | Change handler |
| `helpText` | `string` | Help text below input |
| `error` | `boolean` | Error state |
| `errorText` | `string` | Error message |
| `required` | `boolean` | Required field indicator |
| `placeholder` | `string` | Placeholder text |
| `disabled` | `boolean` | Disabled state |

**Example:**

```jsx
<FormItemInput
  id="vm-name"
  label="Virtual Machine Name"
  value={vmName}
  onChange={(e) => setVmName(e.target.value)}
  helpText="3-50 characters, alphanumeric and hyphens only"
  required={true}
  error={hasError}
  errorText="Name is required and must be unique"
/>
```

---

## FormItemInputPassword

**Import:** `import { FormItemInputPassword } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Form?id=formiteminputpassword

Password input with label and validation.

**Example:**

```jsx
<FormItemInputPassword
  id="admin-password"
  label="Administrator Password"
  value={password}
  onChange={(e) => setPassword(e.target.value)}
  helpText="Minimum 8 characters with at least one number"
/>
```

---

## FormItemSelect

**Import:** `import { FormItemSelect } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Form?id=formitemselect

Select dropdown with integrated label.

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `id` | `string` | Unique identifier |
| `label` | `string` | Select label |
| `rowsData` | `array` | Options with `key` and `label` |
| `selectedRow` | `object` | Currently selected option |
| `onSelectedChange` | `function` | Selection change handler |
| `helpText` | `string` | Help text |
| `error` | `boolean` | Error state |
| `errorText` | `string` | Error message |

**Example:**

```jsx
const clusterOptions = [
  { key: 'prod', label: 'Production' },
  { key: 'dev', label: 'Development' },
  { key: 'test', label: 'Test' }
];

<FormItemSelect
  id="cluster"
  label="Target Cluster"
  rowsData={clusterOptions}
  selectedRow={selectedCluster}
  onSelectedChange={setSelectedCluster}
  required={true}
/>
```

---

## FormItemTextArea

**Import:** `import { FormItemTextArea } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Form?id=formitemtextarea

Multi-line text input with label.

**Example:**

```jsx
<FormItemTextArea
  id="description"
  label="Description"
  value={description}
  onChange={(e) => setDescription(e.target.value)}
  rows={4}
  helpText="Optional description for this resource"
/>
```

---

## FormItemDatePicker

**Import:** `import { FormItemDatePicker } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Form?id=formitemdatepicker

Date picker with integrated label.

**Example:**

```jsx
<FormItemDatePicker
  id="start-date"
  label="Start Date"
  value={startDate}
  onChange={setStartDate}
  format="YYYY-MM-DD"
/>
```

---

## FormItemTimePicker

**Import:** `import { FormItemTimePicker } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Form?id=formitemtimepicker

Time picker with integrated label.

**Example:**

```jsx
<FormItemTimePicker
  id="backup-time"
  label="Daily Backup Time"
  value={backupTime}
  onChange={setBackupTime}
  format="HH:mm"
/>
```

---

## FormItemCodeInput

**Import:** `import { FormItemCodeInput } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Form?id=formitemcodeinput

Code input field with label.

---

## Complete Form Example

```jsx
import {
  Form,
  FormLayout,
  FormSection,
  FormItemInput,
  FormItemSelect,
  FormItemTextArea,
  Button,
  FlexLayout
} from '@nutanix-ui/prism-reactjs';

function CreateVMForm() {
  return (
    <Form>
      <FormLayout>
        <FormSection title="Basic Configuration">
          <FormItemInput
            id="vm-name"
            label="VM Name"
            value={name}
            onChange={(e) => setName(e.target.value)}
            required={true}
          />
          <FormItemSelect
            id="cluster"
            label="Cluster"
            rowsData={clusters}
            selectedRow={selectedCluster}
            onSelectedChange={setSelectedCluster}
            required={true}
          />
        </FormSection>
        
        <FormSection title="Resources">
          <FormItemInput
            id="cpu"
            label="vCPUs"
            type="number"
            value={cpuCount}
            onChange={(e) => setCpuCount(e.target.value)}
          />
          <FormItemInput
            id="memory"
            label="Memory (GB)"
            type="number"
            value={memory}
            onChange={(e) => setMemory(e.target.value)}
          />
        </FormSection>
        
        <FormSection title="Additional">
          <FormItemTextArea
            id="description"
            label="Description"
            value={description}
            onChange={(e) => setDescription(e.target.value)}
            rows={3}
          />
        </FormSection>
        
        <FlexLayout justifyContent="flex-end" itemSpacing="10px">
          <Button type={Button.ButtonTypes.SECONDARY}>Cancel</Button>
          <Button type={Button.ButtonTypes.PRIMARY}>Create VM</Button>
        </FlexLayout>
      </FormLayout>
    </Form>
  );
}
```
