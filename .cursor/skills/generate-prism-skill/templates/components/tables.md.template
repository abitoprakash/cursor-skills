# Table Components

Components for displaying and managing tabular data.

## Table

**Import:** `import { Table } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Table?id=table

Full-featured data table with sorting, selection, pagination, and inline editing.

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `columns` | `array` | Column definitions |
| `dataSource` | `array` | Data rows |
| `rowSelection` | `object` | Selection configuration |
| `onChangeRowSelection` | `function` | Selection change handler |
| `rowAction` | `object` | Row action menu configuration |
| `editRow` | `object` | Inline editing configuration |
| `loading` | `boolean` | Loading state |
| `pagination` | `object/boolean` | Pagination config or false |
| `structure` | `object` | Column widths and structure |

**Column Definition:**
| Property | Type | Description |
|----------|------|-------------|
| `title` | `string/ReactNode` | Column header |
| `key` | `string` | Data key |
| `render` | `function` | Custom cell renderer |
| `sorter` | `boolean/function` | Enable sorting |
| `width` | `string` | Column width |
| `textAlign` | `string` | Text alignment |

**Example:**

```jsx
const columns = [
  {
    title: 'Name',
    key: 'name',
    sorter: true
  },
  {
    title: 'Status',
    key: 'status',
    render: (status) => (
      <Badge color={status === 'active' ? 'green' : 'gray'} count={status} />
    )
  },
  {
    title: 'CPU',
    key: 'cpu',
    textAlign: 'right'
  },
  {
    title: 'Memory',
    key: 'memory',
    textAlign: 'right',
    render: (value) => `${value} GB`
  }
];

const dataSource = [
  { key: '1', name: 'VM-001', status: 'active', cpu: 4, memory: 8 },
  { key: '2', name: 'VM-002', status: 'stopped', cpu: 2, memory: 4 },
  { key: '3', name: 'VM-003', status: 'active', cpu: 8, memory: 16 }
];

<Table
  columns={columns}
  dataSource={dataSource}
/>
```

---

## Table with Selection

```jsx
const [rowSelection, setRowSelection] = useState({ selected: [] });

<Table
  columns={columns}
  dataSource={dataSource}
  rowSelection={rowSelection}
  onChangeRowSelection={setRowSelection}
/>

// Access selected rows
// rowSelection.selected contains array of selected row keys
```

---

## Table with Row Actions

```jsx
const rowAction = {
  actions: [
    { key: 'edit', value: 'Edit' },
    { key: 'clone', value: 'Clone' },
    { key: 'delete', value: 'Delete' }
  ],
  onRowAction: (actionKey, rowData) => {
    switch (actionKey) {
      case 'edit':
        handleEdit(rowData);
        break;
      case 'delete':
        handleDelete(rowData);
        break;
    }
  },
  getPopupContainer: () => document.body
};

<Table
  columns={columns}
  dataSource={dataSource}
  rowAction={rowAction}
/>
```

---

## Table with Inline Editing

```jsx
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
        max: 128
      }
    }
  },
  row: null // Key of row being edited
});

<Table
  columns={columns}
  dataSource={dataSource}
  editRow={editRow}
  onClickEditRowSubmit={(newDataSource, newEditRow, cellAlerts) => {
    setDataSource(newDataSource);
    setEditRow(newEditRow);
  }}
  onClickEditRowCancel={(dataSource, editRow, cellAlerts) => {
    setEditRow(editRow);
  }}
/>
```

---

## Table with Pagination

```jsx
<Table
  columns={columns}
  dataSource={dataSource}
  pagination={{
    current: currentPage,
    total: totalItems,
    pageSize: 10,
    onChange: (page, pageSize) => {
      setCurrentPage(page);
    }
  }}
/>
```

---

## LocalTable

**Import:** `import { LocalTable } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Table?id=localtable

Client-side table with built-in sorting and filtering.

**Example:**

```jsx
<LocalTable
  columns={columns}
  dataSource={dataSource}
  searchable={true}
  pagination={{ pageSize: 10 }}
/>
```

---

## WidgetTable

**Import:** `import { WidgetTable } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Table?id=widgettable

Compact table for dashboard widgets.

**Example:**

```jsx
<WidgetTable
  columns={[
    { title: 'Name', key: 'name' },
    { title: 'Value', key: 'value', textAlign: 'right' }
  ]}
  dataSource={widgetData}
/>
```

---

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
      memory: '100px'
    }
  }}
/>
```

---

## Custom Cell Rendering

```jsx
const columns = [
  {
    title: 'Name',
    key: 'name',
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
    title: 'Actions',
    key: 'actions',
    render: (_, record) => (
      <Button 
        aria-label={`Edit ${record.name}`}
        type={Button.ButtonTypes.ICON_SECONDARY}
      >
        <EditIcon aria-hidden="true" />
      </Button>
    )
  }
];
```
