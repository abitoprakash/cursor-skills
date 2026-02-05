# Form Components - Detailed Documentation

Building forms with proper structure, validation, and accessibility.

**Storybook:** http://prism-styleguide/v2/#/Components/Form?id=form

## Import

```jsx
import {
  Form,
  FormLayout,
  FormSection,
  FormItemInput,
  FormItemSelect,
  FormItemTextArea,
  FormItemDatePicker,
  FormItemTimePicker,
  FormItemInputPassword,
  FormItemCodeInput
} from '@nutanix-ui/prism-reactjs';
```

## Basic Form Structure

```jsx
<Form>
  <FormLayout>
    <FormSection title="General Configuration">
      <FormItemInput id="name" label="Name" />
      <FormItemInput id="description" label="Description" />
    </FormSection>
    
    <FormSection title="Advanced Settings">
      <FormItemSelect id="type" label="Type" rowsData={typeOptions} />
    </FormSection>
    
    <FlexLayout justifyContent="flex-end" itemSpacing="10px">
      <Button type="secondary">Cancel</Button>
      <Button>Save</Button>
    </FlexLayout>
  </FormLayout>
</Form>
```

## FormItemInput

Text input with integrated label and validation.

### Props

| Prop | Type | Description |
|------|------|-------------|
| `id` | `string` | Unique identifier (required for a11y) |
| `label` | `string` | Input label |
| `value` | `string` | Input value |
| `onChange` | `function` | Change handler |
| `placeholder` | `string` | Placeholder text |
| `helpText` | `string` | Help text below input |
| `required` | `boolean` | Required field indicator |
| `disabled` | `boolean` | Disabled state |
| `error` | `boolean` | Error state |
| `errorText` | `string` | Error message |
| `type` | `string` | Input type (text, email, number, etc.) |

### Basic Usage

```jsx
<FormItemInput
  id="vm-name"
  label="Virtual Machine Name"
  value={vmName}
  onChange={(e) => setVmName(e.target.value)}
  placeholder="Enter VM name"
  helpText="Alphanumeric characters and hyphens only"
/>
```

### With Validation

```jsx
const [name, setName] = useState('');
const [error, setError] = useState(false);
const [errorText, setErrorText] = useState('');

const validateName = (value) => {
  if (!value) {
    setError(true);
    setErrorText('Name is required');
    return false;
  }
  if (value.length < 3) {
    setError(true);
    setErrorText('Name must be at least 3 characters');
    return false;
  }
  if (!/^[a-zA-Z0-9-]+$/.test(value)) {
    setError(true);
    setErrorText('Only alphanumeric characters and hyphens allowed');
    return false;
  }
  setError(false);
  setErrorText('');
  return true;
};

<FormItemInput
  id="name"
  label="Name"
  value={name}
  onChange={(e) => {
    setName(e.target.value);
    validateName(e.target.value);
  }}
  onBlur={() => validateName(name)}
  required
  error={error}
  errorText={errorText}
/>
```

## FormItemSelect

Select dropdown with label.

```jsx
const clusterOptions = [
  { key: 'cluster-1', label: 'Production Cluster' },
  { key: 'cluster-2', label: 'Development Cluster' }
];

const [selectedCluster, setSelectedCluster] = useState(null);

<FormItemSelect
  id="cluster"
  label="Target Cluster"
  rowsData={clusterOptions}
  selectedRow={selectedCluster}
  onSelectedChange={setSelectedCluster}
  required
  error={!selectedCluster && submitted}
  errorText="Please select a cluster"
/>
```

## FormItemTextArea

Multi-line text input.

```jsx
<FormItemTextArea
  id="description"
  label="Description"
  value={description}
  onChange={(e) => setDescription(e.target.value)}
  rows={4}
  helpText="Optional description for this resource"
  maxLength={500}
/>
```

## FormItemInputPassword

Password input with show/hide toggle.

```jsx
<FormItemInputPassword
  id="admin-password"
  label="Administrator Password"
  value={password}
  onChange={(e) => setPassword(e.target.value)}
  helpText="Minimum 8 characters, including a number and special character"
  required
  error={password.length > 0 && password.length < 8}
  errorText="Password must be at least 8 characters"
/>
```

## FormItemDatePicker

Date selection input.

```jsx
<FormItemDatePicker
  id="start-date"
  label="Start Date"
  value={startDate}
  onChange={setStartDate}
  format="YYYY-MM-DD"
/>
```

## FormItemTimePicker

Time selection input.

```jsx
<FormItemTimePicker
  id="backup-time"
  label="Daily Backup Time"
  value={backupTime}
  onChange={setBackupTime}
  format="HH:mm"
/>
```

## FormSection

Group related form fields.

### Props

| Prop | Type | Description |
|------|------|-------------|
| `title` | `string` | Section title |
| `background` | `string` | Background: 'base', 'alt' |
| `padding` | `string` | Inner padding |

### Basic Usage

```jsx
<FormSection title="Network Configuration">
  <FormItemInput id="ip" label="IP Address" />
  <FormItemSelect id="subnet" label="Subnet" rowsData={subnets} />
</FormSection>
```

### Nested Background

```jsx
<FormSection 
  title="Advanced Options"
  background="alt"
  padding="20px"
>
  <FormItemInput id="custom-setting" label="Custom Setting" />
</FormSection>
```

## Form Validation Pattern

```jsx
function VMForm({ onSubmit }) {
  const [formData, setFormData] = useState({
    name: '',
    cluster: null,
    cpu: 1,
    memory: 2
  });
  
  const [errors, setErrors] = useState({});
  const [submitted, setSubmitted] = useState(false);

  const validate = () => {
    const newErrors = {};
    
    if (!formData.name) {
      newErrors.name = 'Name is required';
    } else if (formData.name.length < 3) {
      newErrors.name = 'Name must be at least 3 characters';
    }
    
    if (!formData.cluster) {
      newErrors.cluster = 'Please select a cluster';
    }
    
    if (formData.cpu < 1 || formData.cpu > 128) {
      newErrors.cpu = 'CPU must be between 1 and 128';
    }
    
    if (formData.memory < 1 || formData.memory > 256) {
      newErrors.memory = 'Memory must be between 1 and 256 GB';
    }
    
    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = () => {
    setSubmitted(true);
    if (validate()) {
      onSubmit(formData);
    }
  };

  const updateField = (field, value) => {
    setFormData(prev => ({ ...prev, [field]: value }));
    // Clear error when user starts typing
    if (errors[field]) {
      setErrors(prev => ({ ...prev, [field]: null }));
    }
  };

  return (
    <Form>
      <FormLayout>
        <FormSection title="Basic Information">
          <FormItemInput
            id="vm-name"
            label="VM Name"
            value={formData.name}
            onChange={(e) => updateField('name', e.target.value)}
            required
            error={submitted && !!errors.name}
            errorText={errors.name}
          />
          <FormItemSelect
            id="cluster"
            label="Cluster"
            rowsData={clusterOptions}
            selectedRow={formData.cluster}
            onSelectedChange={(row) => updateField('cluster', row)}
            required
            error={submitted && !!errors.cluster}
            errorText={errors.cluster}
          />
        </FormSection>
        
        <FormSection title="Resources">
          <FormItemInput
            id="cpu"
            label="vCPUs"
            type="number"
            value={formData.cpu}
            onChange={(e) => updateField('cpu', parseInt(e.target.value))}
            error={submitted && !!errors.cpu}
            errorText={errors.cpu}
          />
          <FormItemInput
            id="memory"
            label="Memory (GB)"
            type="number"
            value={formData.memory}
            onChange={(e) => updateField('memory', parseInt(e.target.value))}
            error={submitted && !!errors.memory}
            errorText={errors.memory}
          />
        </FormSection>
        
        <FlexLayout justifyContent="flex-end" itemSpacing="10px">
          <Button type="secondary">Cancel</Button>
          <Button onClick={handleSubmit}>Create VM</Button>
        </FlexLayout>
      </FormLayout>
    </Form>
  );
}
```

## Form in Modal

```jsx
<Modal
  visible={visible}
  title="Create Resource"
  width="600px"
  onClose={handleClose}
  footer={
    <FlexLayout justifyContent="flex-end" itemSpacing="10px">
      <Button type="secondary" onClick={handleClose}>Cancel</Button>
      <Button onClick={handleSubmit} disabled={!isValid}>Create</Button>
    </FlexLayout>
  }
>
  <Form>
    <FormLayout>
      <FormSection title="Configuration">
        <FormItemInput id="name" label="Name" required />
        <FormItemSelect 
          id="type" 
          label="Type" 
          rowsData={typeOptions}
          getPopupContainer={() => modalRef.current}
        />
      </FormSection>
    </FormLayout>
  </Form>
</Modal>
```

## Accessibility Requirements

### Labels

Every input **must** have a label:
- Connected via `id` prop
- Visible and persistent (not just placeholder)
- Includes requirements (optional, max length, etc.)

### Error Messages

- Must be text-based (not just color/icon)
- Should suggest how to fix
- Programmatically associated with input

```jsx
<FormItemInput
  id="email"
  label="Email Address"
  error={true}
  errorText="Please enter a valid email address (e.g., user@example.com)"
/>
```

### Required Fields

```jsx
<FormItemInput
  id="name"
  label="Name"
  required  // Shows asterisk and sets aria-required
/>
```

## Complete Example

```jsx
import React, { useState, useRef } from 'react';
import {
  Modal,
  Form,
  FormLayout,
  FormSection,
  FormItemInput,
  FormItemSelect,
  FormItemTextArea,
  FormItemInputPassword,
  Button,
  FlexLayout,
  Alert
} from '@nutanix-ui/prism-reactjs';

function CreateUserModal({ visible, onClose, onSubmit }) {
  const modalRef = useRef(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  
  const [formData, setFormData] = useState({
    username: '',
    email: '',
    password: '',
    role: null,
    notes: ''
  });
  
  const [validationErrors, setValidationErrors] = useState({});

  const roleOptions = [
    { key: 'admin', label: 'Administrator' },
    { key: 'user', label: 'Standard User' },
    { key: 'viewer', label: 'Viewer' }
  ];

  const updateField = (field, value) => {
    setFormData(prev => ({ ...prev, [field]: value }));
    setValidationErrors(prev => ({ ...prev, [field]: null }));
  };

  const validate = () => {
    const errors = {};
    if (!formData.username) errors.username = 'Username is required';
    if (!formData.email) errors.email = 'Email is required';
    if (!formData.password) errors.password = 'Password is required';
    if (formData.password && formData.password.length < 8) {
      errors.password = 'Password must be at least 8 characters';
    }
    if (!formData.role) errors.role = 'Role is required';
    
    setValidationErrors(errors);
    return Object.keys(errors).length === 0;
  };

  const handleSubmit = async () => {
    if (!validate()) return;
    
    setLoading(true);
    setError(null);
    
    try {
      await onSubmit(formData);
      onClose();
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <Modal
      visible={visible}
      modalWrapRef={modalRef}
      title="Create User"
      width="500px"
      onClose={onClose}
      restoreFocus={true}
      footer={
        <FlexLayout justifyContent="flex-end" itemSpacing="10px">
          <Button type="secondary" onClick={onClose} disabled={loading}>
            Cancel
          </Button>
          <Button onClick={handleSubmit} disabled={loading}>
            {loading ? 'Creating...' : 'Create User'}
          </Button>
        </FlexLayout>
      }
    >
      {error && (
        <Alert
          type={Alert.AlertTypes.ERROR}
          message={error}
          showCloseIcon={false}
        />
      )}
      
      <Form>
        <FormLayout>
          <FormSection title="Account Information">
            <FormItemInput
              id="username"
              label="Username"
              value={formData.username}
              onChange={(e) => updateField('username', e.target.value)}
              required
              error={!!validationErrors.username}
              errorText={validationErrors.username}
            />
            <FormItemInput
              id="email"
              label="Email Address"
              type="email"
              value={formData.email}
              onChange={(e) => updateField('email', e.target.value)}
              required
              error={!!validationErrors.email}
              errorText={validationErrors.email}
            />
            <FormItemInputPassword
              id="password"
              label="Password"
              value={formData.password}
              onChange={(e) => updateField('password', e.target.value)}
              required
              helpText="Minimum 8 characters"
              error={!!validationErrors.password}
              errorText={validationErrors.password}
            />
          </FormSection>
          
          <FormSection title="Permissions">
            <FormItemSelect
              id="role"
              label="Role"
              rowsData={roleOptions}
              selectedRow={formData.role}
              onSelectedChange={(row) => updateField('role', row)}
              required
              error={!!validationErrors.role}
              errorText={validationErrors.role}
              getPopupContainer={() => modalRef.current}
            />
          </FormSection>
          
          <FormSection title="Additional Information">
            <FormItemTextArea
              id="notes"
              label="Notes"
              value={formData.notes}
              onChange={(e) => updateField('notes', e.target.value)}
              rows={3}
              helpText="Optional notes about this user"
            />
          </FormSection>
        </FormLayout>
      </Form>
    </Modal>
  );
}
```
