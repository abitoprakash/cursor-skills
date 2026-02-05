# Table Component - Detailed Documentation

The Table component is one of the most complex components in Prism UI, supporting sorting, selection, pagination, inline editing, row actions, and custom cell rendering.

**Storybook:** http://prism-styleguide/v2/#/Components/Table?id=table

## Import

```jsx
import { Table, LocalTable, WidgetTable } from '@nutanix-ui/prism-reactjs';
```

## Basic Usage

```jsx
const columns = [
  { title: 'Name', key: 'name' },
  { title: 'Status', key: 'status' },
  { title: 'Created', key: 'created' }
];

const dataSource = [
  { key: '1', name: 'VM-001', status: 'Running', created: '2024-01-15' },
  { key: '2', name: 'VM-002', status: 'Stopped', created: '2024-01-16' }
];

<Table columns={columns} dataSource={dataSource} />
```

## Column Configuration

### Column Definition Object

```typescript
interface Column {
  title: string | ReactNode;    // Column header
  key: string;                  // Data key in row object
  render?: (value, record, index) => ReactNode;  // Custom renderer
  sorter?: boolean | ((a, b) => number);         // Enable sorting
  sortOrder?: 'ascend' | 'descend' | null;       // Current sort
  width?: string;               // Column width
  textAlign?: 'left' | 'center' | 'right';       // Text alignment
  className?: string;           // Custom class
  fixed?: 'left' | 'right';     // Fixed column position
}
```

### Example Column Configurations

```jsx
const columns = [
  // Basic column
  { title: 'Name', key: 'name' },
  
  // With custom width
  { title: 'ID', key: 'id', width: '100px' },
  
  // Right-aligned (for numbers)
  { title: 'CPU', key: 'cpu', textAlign: 'right' },
  
  // With sorting
  { title: 'Memory', key: 'memory', sorter: true },
  
  // With custom render
  {
    title: 'Status',
    key: 'status',
    render: (status) => (
      <Badge color={status === 'running' ? 'green' : 'gray'} count={status} />
    )
  },
  
  // Complex render with full record
  {
    title: 'Actions',
    key: 'actions',
    render: (_, record) => (
      <Button 
        aria-label={`Edit ${record.name}`}
        type={Button.ButtonTypes.ICON_SECONDARY}
        onClick={() => handleEdit(record)}
      >
        <EditIcon aria-hidden="true" />
      </Button>
    )
  }
];
```

## Row Selection

Enable row selection for bulk actions.

```jsx
const [rowSelection, setRowSelection] = useState({
  selected: [],           // Array of selected row keys
  selectedRows: []        // Array of selected row objects
});

<Table
  columns={columns}
  dataSource={dataSource}
  rowSelection={rowSelection}
  onChangeRowSelection={(newSelection) => {
    setRowSelection(newSelection);
  }}
/>

// Get selected items
const handleBulkDelete = () => {
  const selectedIds = rowSelection.selected;
  // or use rowSelection.selectedRows for full objects
};
```

### Selection Configuration

```jsx
const rowSelection = {
  selected: [],
  type: 'checkbox',         // 'checkbox' or 'radio'
  getCheckboxProps: (record) => ({
    disabled: record.status === 'locked',
    name: record.name
  })
};
```

## Row Actions

Add action menu to each row.

```jsx
const rowAction = {
  actions: [
    { key: 'edit', value: 'Edit' },
    { key: 'clone', value: 'Clone' },
    { key: 'power', value: 'Power On' },
    { 
      key: 'delete', 
      value: 'Delete',
      disabled: (record) => record.status === 'running'
    }
  ],
  onRowAction: (actionKey, rowData) => {
    switch (actionKey) {
      case 'edit':
        openEditModal(rowData);
        break;
      case 'clone':
        handleClone(rowData);
        break;
      case 'delete':
        confirmDelete(rowData);
        break;
    }
  },
  getPopupContainer: () => document.querySelector('.table-container')
};

<Table
  columns={columns}
  dataSource={dataSource}
  rowAction={rowAction}
/>
```

## Inline Editing

Enable inline row editing.

```jsx
const [dataSource, setDataSource] = useState(initialData);
const [cellAlerts, setCellAlerts] = useState([]);

const [editRow, setEditRow] = useState({
  columnConfigs: {
    name: {
      validations: {
        required: true,
        message: 'Name is required'
      }
    },
    cpu: {
      type: Table.CELL_EDIT_TYPES.NUMBER,
      validations: {
        min: 1,
        max: 128,
        message: 'CPU must be between 1 and 128'
      }
    },
    cluster: {
      type: Table.CELL_EDIT_TYPES.SELECT,
      selectProps: () => ({
        rowsData: clusterOptions,
        getPopupContainer: () => document.body
      })
    }
  },
  row: null  // Key of row currently being edited
});

// Enable editing for a row
const handleEdit = (record) => {
  setEditRow(prev => ({ ...prev, row: record.key }));
};

<Table
  columns={columns}
  dataSource={dataSource}
  editRow={editRow}
  cellAlerts={cellAlerts}
  onClickEditRowSubmit={(newDataSource, newEditRow, newCellAlerts) => {
    setDataSource(newDataSource);
    setEditRow(newEditRow);
    setCellAlerts(newCellAlerts);
  }}
  onClickEditRowCancel={(dataSource, editRow, cellAlerts) => {
    setEditRow(editRow);
    setCellAlerts(cellAlerts);
  }}
/>
```

### Cell Edit Types

```jsx
Table.CELL_EDIT_TYPES.TEXT      // Default text input
Table.CELL_EDIT_TYPES.NUMBER    // Number input
Table.CELL_EDIT_TYPES.SELECT    // Select dropdown
```

## Sorting

### Client-Side Sorting

```jsx
const [sortConfig, setSortConfig] = useState({ key: null, order: null });

const columns = [
  {
    title: 'Name',
    key: 'name',
    sorter: true,
    sortOrder: sortConfig.key === 'name' ? sortConfig.order : null
  },
  {
    title: 'CPU',
    key: 'cpu',
    sorter: (a, b) => a.cpu - b.cpu,  // Custom sort function
    sortOrder: sortConfig.key === 'cpu' ? sortConfig.order : null
  }
];

<Table
  columns={columns}
  dataSource={dataSource}
  onChange={(pagination, filters, sorter) => {
    setSortConfig({
      key: sorter.columnKey,
      order: sorter.order
    });
  }}
/>
```

## Pagination

### Built-in Pagination

```jsx
<Table
  columns={columns}
  dataSource={dataSource}
  pagination={{
    current: currentPage,
    total: totalItems,
    pageSize: 10,
    showSizeChanger: true,
    showQuickJumper: true,
    onChange: (page, pageSize) => {
      setCurrentPage(page);
      fetchData(page, pageSize);
    }
  }}
/>
```

### Disable Pagination

```jsx
<Table
  columns={columns}
  dataSource={dataSource}
  pagination={false}
/>
```

## Column Width Configuration

```jsx
<Table
  columns={columns}
  dataSource={dataSource}
  structure={{
    columnWidths: {
      name: '200px',
      status: '100px',
      cpu: '80px',
      memory: '100px',
      actions: '60px'
    }
  }}
/>
```

## Loading State

```jsx
<Table
  columns={columns}
  dataSource={dataSource}
  loading={isLoading}
/>
```

## Empty State

```jsx
<Table
  columns={columns}
  dataSource={[]}
  emptyText="No virtual machines found"
/>
```

## Accessibility

### Selection Accessibility

- Row selection uses proper checkbox inputs
- Keyboard navigation supported with Tab and Space

### Action Menu Accessibility

```jsx
const rowAction = {
  actions: [
    { 
      key: 'edit', 
      value: 'Edit',
      'aria-label': (record) => `Edit ${record.name}`
    }
  ],
  // ...
};
```

### Screen Reader Announcements

For dynamic updates (sorting, filtering), consider adding:

```jsx
<div aria-live="polite" className="sr-only">
  {`Showing ${dataSource.length} items, sorted by ${sortConfig.key}`}
</div>
```

## LocalTable vs Table

Use `LocalTable` for:
- Small datasets (< 1000 rows)
- Client-side sorting and filtering
- Built-in search functionality

```jsx
<LocalTable
  columns={columns}
  dataSource={dataSource}
  searchable={true}
  pagination={{ pageSize: 20 }}
/>
```

Use `Table` for:
- Large datasets with server-side pagination
- Complex editing requirements
- Custom sorting/filtering logic

## Complete Example

```jsx
import React, { useState } from 'react';
import { 
  Table, 
  Button, 
  Badge,
  FlexLayout,
  StatusIcon,
  Tooltip
} from '@nutanix-ui/prism-reactjs';

function VMTable() {
  const [dataSource, setDataSource] = useState(initialVMs);
  const [rowSelection, setRowSelection] = useState({ selected: [] });
  const [loading, setLoading] = useState(false);

  const columns = [
    {
      title: 'Name',
      key: 'name',
      sorter: true,
      render: (name, record) => (
        <Link href={`/vms/${record.key}`}>{name}</Link>
      )
    },
    {
      title: 'Status',
      key: 'status',
      render: (status) => (
        <FlexLayout alignItems="center" itemSpacing="5px">
          <StatusIcon 
            type={status === 'running' 
              ? StatusIcon.StatusIconTypes.SUCCESS 
              : StatusIcon.StatusIconTypes.WARNING
            }
          />
          <span>{status}</span>
        </FlexLayout>
      )
    },
    {
      title: 'CPU',
      key: 'cpu',
      textAlign: 'right',
      width: '80px'
    },
    {
      title: 'Memory',
      key: 'memory',
      textAlign: 'right',
      width: '100px',
      render: (value) => `${value} GB`
    }
  ];

  const rowAction = {
    actions: [
      { key: 'edit', value: 'Edit' },
      { key: 'clone', value: 'Clone' },
      { key: 'delete', value: 'Delete' }
    ],
    onRowAction: handleRowAction
  };

  return (
    <Table
      columns={columns}
      dataSource={dataSource}
      rowSelection={rowSelection}
      onChangeRowSelection={setRowSelection}
      rowAction={rowAction}
      loading={loading}
      pagination={{
        total: dataSource.length,
        pageSize: 10
      }}
    />
  );
}
```
