# Data Input Components

Components for user data entry.

## Input

**Import:** `import { Input } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Data%20Input?id=input

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `value` | `string` | Input value |
| `onChange` | `function` | Change handler |
| `placeholder` | `string` | Placeholder text |
| `disabled` | `boolean` | Disables input |
| `error` | `boolean` | Shows error state |
| `errorType` | `ErrorType` | ERROR or WARNING |
| `prefix` | `ReactNode` | Content before input |
| `suffix` | `ReactNode` | Content after input |

**Example:**

```jsx
<Input
  value={name}
  onChange={(e) => setName(e.target.value)}
  placeholder="Enter name"
  prefix={<MagGlassIcon />}
/>

// With error state
<Input
  value={email}
  onChange={handleChange}
  error={hasError}
  errorType={Input.ErrorType.ERROR}
/>
```

---

## TextInput

**Import:** `import { TextInput } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Data%20Input?id=textinput

Base text input component. Similar to Input but more basic.

---

## InputNumber

**Import:** `import { InputNumber } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Data%20Input?id=inputnumber

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `value` | `number` | Current value |
| `onValueChange` | `function` | Change handler (receives number) |
| `min` | `number` | Minimum value |
| `max` | `number` | Maximum value |
| `step` | `number` | Increment step |

**Example:**

```jsx
<InputNumber
  value={cpuCount}
  onValueChange={setCpuCount}
  min={1}
  max={128}
  step={1}
/>
```

---

## InputPassword

**Import:** `import { InputPassword } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Data%20Input?id=inputpassword

Password input with show/hide toggle.

**Example:**

```jsx
<InputPassword
  value={password}
  onChange={(e) => setPassword(e.target.value)}
  placeholder="Enter password"
/>
```

---

## Select

**Import:** `import { Select } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Data%20Input?id=select

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `rowsData` | `array` | Options array with `key` and `label` |
| `selectedRow` | `object` | Currently selected option |
| `onSelectedChange` | `function` | Selection change handler |
| `label` | `string` | Label for the select |
| `placeholder` | `string` | Placeholder text |
| `searchable` | `boolean` | Enable search filtering |
| `getPopupContainer` | `function` | Where to mount dropdown |

**Example:**

```jsx
const options = [
  { key: 'cluster-1', label: 'Production Cluster' },
  { key: 'cluster-2', label: 'Development Cluster' },
  { key: 'cluster-3', label: 'Test Cluster' }
];

<Select
  label="Select Cluster"
  rowsData={options}
  selectedRow={selectedCluster}
  onSelectedChange={setSelectedCluster}
  searchable={true}
/>
```

---

## MultiSelect

**Import:** `import { MultiSelect } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Data%20Input?id=multiselect

Select with multiple selection capability.

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `rowsData` | `array` | Options array |
| `selectedRows` | `array` | Currently selected options |
| `onSelectedChange` | `function` | Selection change handler |

**Example:**

```jsx
<MultiSelect
  label="Select Tags"
  rowsData={tagOptions}
  selectedRows={selectedTags}
  onSelectedChange={setSelectedTags}
/>
```

---

## Checkbox

**Import:** `import { Checkbox } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Data%20Input?id=checkbox

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `checked` | `boolean` | Checked state |
| `onChange` | `function` | Change handler |
| `label` | `string` | Label text |
| `id` | `string` | Unique identifier |
| `type` | `CheckboxTypes` | DEFAULT or TOGGLE |
| `indeterminate` | `boolean` | Partially checked state |

**Example:**

```jsx
// Standard checkbox
<Checkbox
  id="enable-feature"
  checked={enabled}
  onChange={(e) => setEnabled(e.target.checked)}
  label="Enable this feature"
/>

// Toggle switch
<Checkbox
  id="dark-mode"
  type={Checkbox.CheckboxTypes.TOGGLE}
  checked={darkMode}
  onChange={(e) => setDarkMode(e.target.checked)}
  label="Dark mode"
/>
```

---

## Radio / RadioGroup

**Import:** `import { Radio, RadioGroup } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Data%20Input?id=radiogroup

**RadioGroup Props:**
| Prop | Type | Description |
|------|------|-------------|
| `selectedValue` | `string` | Currently selected value |
| `onChange` | `function` | Change handler (receives value) |

**Radio Props:**
| Prop | Type | Description |
|------|------|-------------|
| `value` | `string` | Radio value |
| `additionalInfo` | `string` | Help text below label |

**Example:**

```jsx
<RadioGroup
  selectedValue={size}
  onChange={setSize}
>
  <Radio value="small" additionalInfo="1 vCPU, 2GB RAM">
    Small
  </Radio>
  <Radio value="medium" additionalInfo="2 vCPU, 4GB RAM">
    Medium
  </Radio>
  <Radio value="large" additionalInfo="4 vCPU, 8GB RAM">
    Large
  </Radio>
</RadioGroup>
```

---

## Slider

**Import:** `import { Slider } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Data%20Input?id=slider

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `value` | `number` | Current value |
| `onChange` | `function` | Change handler |
| `min` | `number` | Minimum value |
| `max` | `number` | Maximum value |
| `step` | `number` | Increment step |
| `marks` | `object` | Mark points on slider |

**Example:**

```jsx
<Slider
  value={volume}
  onChange={setVolume}
  min={0}
  max={100}
  step={10}
  marks={{ 0: '0%', 50: '50%', 100: '100%' }}
/>
```

---

## TextArea

**Import:** `import { TextArea } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Data%20Input?id=textarea

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `value` | `string` | Text content |
| `onChange` | `function` | Change handler |
| `rows` | `number` | Number of visible rows |
| `maxLength` | `number` | Maximum characters |
| `showCount` | `boolean` | Show character count |

**Example:**

```jsx
<TextArea
  value={description}
  onChange={(e) => setDescription(e.target.value)}
  rows={4}
  maxLength={500}
  showCount={true}
  placeholder="Enter description..."
/>
```

---

## DatePicker

**Import:** `import { DatePicker } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Data%20Input?id=datepicker

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `value` | `Date/moment` | Selected date |
| `onChange` | `function` | Change handler |
| `format` | `string` | Date format string |
| `disabledDate` | `function` | Function to disable dates |

**Example:**

```jsx
<DatePicker
  value={selectedDate}
  onChange={setSelectedDate}
  format="YYYY-MM-DD"
/>
```

---

## TimePicker

**Import:** `import { TimePicker } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Data%20Input?id=timepicker

**Example:**

```jsx
<TimePicker
  value={selectedTime}
  onChange={setSelectedTime}
  format="HH:mm"
/>
```

---

## FileInput

**Import:** `import { FileInput } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Data%20Input?id=fileinput

File upload input component.

**Example:**

```jsx
<FileInput
  accept=".json,.yaml"
  onChange={handleFileSelect}
  multiple={false}
/>
```
