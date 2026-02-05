# Navigation Components

Components for navigation and wayfinding.

## Tabs

**Import:** `import { Tabs, TabItem } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Navigation?id=tabs

**Key Props (Tabs):**
| Prop | Type | Description |
|------|------|-------------|
| `activeKey` | `string` | Currently active tab key |
| `onTabClick` | `function` | Tab click handler (receives key) |
| `defaultActiveKey` | `string` | Default active tab |
| `appearance` | `string` | Tab style variant |

**Key Props (TabItem):**
| Prop | Type | Description |
|------|------|-------------|
| `tabKey` | `string` | Unique tab identifier |
| `title` | `string/ReactNode` | Tab label |
| `disabled` | `boolean` | Disable tab |

**Example:**

```jsx
const [activeTab, setActiveTab] = useState('overview');

<Tabs activeKey={activeTab} onTabClick={setActiveTab}>
  <TabItem tabKey="overview" title="Overview">
    <StackingLayout padding="20px">
      <Paragraph>Overview content</Paragraph>
    </StackingLayout>
  </TabItem>
  <TabItem tabKey="details" title="Details">
    <StackingLayout padding="20px">
      <Paragraph>Details content</Paragraph>
    </StackingLayout>
  </TabItem>
  <TabItem tabKey="settings" title="Settings">
    <StackingLayout padding="20px">
      <Paragraph>Settings content</Paragraph>
    </StackingLayout>
  </TabItem>
</Tabs>
```

---

## Menu

**Import:** `import { Menu, MenuItem, MenuGroup, MenuController } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Navigation?id=menu

Vertical navigation menu.

**Key Props (Menu):**
| Prop | Type | Description |
|------|------|-------------|
| `selectedKey` | `string` | Currently selected item |
| `onSelect` | `function` | Selection handler |
| `appearance` | `MenuAppearance` | COMPACT or DEFAULT |
| `mode` | `string` | 'vertical' or 'inline' |

**Key Props (MenuItem):**
| Prop | Type | Description |
|------|------|-------------|
| `key` | `string` | Unique identifier |
| `icon` | `ReactNode` | Leading icon |
| `disabled` | `boolean` | Disabled state |

**Example:**

```jsx
<Menu
  selectedKey={currentPage}
  onSelect={handleNavigate}
  mode="vertical"
>
  <MenuItem key="dashboard" icon={<DashboardIcon />}>
    Dashboard
  </MenuItem>
  <MenuItem key="vms" icon={<VMIcon />}>
    Virtual Machines
  </MenuItem>
  <MenuGroup title="Settings">
    <MenuItem key="users" icon={<UserIcon />}>
      Users
    </MenuItem>
    <MenuItem key="config" icon={<SettingsIcon />}>
      Configuration
    </MenuItem>
  </MenuGroup>
</Menu>
```

---

## Breadcrumb

**Import:** `import { Breadcrumb, BreadcrumbItem } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Navigation?id=breadcrumb

Navigation trail showing page hierarchy.

**Key Props (BreadcrumbItem):**
| Prop | Type | Description |
|------|------|-------------|
| `href` | `string` | Link URL |
| `onClick` | `function` | Click handler |

**Example:**

```jsx
<Breadcrumb>
  <BreadcrumbItem href="/">Home</BreadcrumbItem>
  <BreadcrumbItem href="/infrastructure">Infrastructure</BreadcrumbItem>
  <BreadcrumbItem href="/infrastructure/vms">Virtual Machines</BreadcrumbItem>
  <BreadcrumbItem>VM-001</BreadcrumbItem>
</Breadcrumb>
```

---

## Steps

**Import:** `import { Steps, StepItem } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Navigation?id=steps

Multi-step wizard navigation.

**Key Props (Steps):**
| Prop | Type | Description |
|------|------|-------------|
| `current` | `number` | Current step index |
| `direction` | `string` | 'horizontal' or 'vertical' |
| `status` | `string` | Current step status |

**Key Props (StepItem):**
| Prop | Type | Description |
|------|------|-------------|
| `title` | `string` | Step title |
| `description` | `string` | Step description |
| `status` | `string` | 'wait', 'process', 'finish', 'error' |

**Example:**

```jsx
<Steps current={currentStep}>
  <StepItem title="Basic Info" description="Enter VM details" />
  <StepItem title="Resources" description="Configure CPU and memory" />
  <StepItem title="Network" description="Set up networking" />
  <StepItem title="Review" description="Review and create" />
</Steps>
```

---

## Pagination

**Import:** `import { Pagination } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Navigation?id=pagination

Page navigation for large datasets.

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `current` | `number` | Current page number |
| `total` | `number` | Total items |
| `pageSize` | `number` | Items per page |
| `onChange` | `function` | Page change handler |
| `showSizeChanger` | `boolean` | Show page size dropdown |
| `showQuickJumper` | `boolean` | Show jump to page input |

**Example:**

```jsx
<Pagination
  current={currentPage}
  total={totalItems}
  pageSize={pageSize}
  onChange={(page, size) => {
    setCurrentPage(page);
    setPageSize(size);
  }}
  showSizeChanger={true}
  showQuickJumper={true}
/>
```

---

## Anchor

**Import:** `import { Anchor, AnchorLink } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Navigation?id=anchor

In-page anchor navigation.

**Example:**

```jsx
<Anchor>
  <AnchorLink href="#section1" title="Section 1" />
  <AnchorLink href="#section2" title="Section 2" />
  <AnchorLink href="#section3" title="Section 3" />
</Anchor>
```

---

## ViewSwitcher

**Import:** `import { ViewSwitcher } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Navigation?id=viewswitcher

Toggle between different view types (grid, list, etc.).

**Example:**

```jsx
<ViewSwitcher
  activeView={viewType}
  onViewChange={setViewType}
  views={[
    { key: 'grid', icon: <GridViewIcon /> },
    { key: 'list', icon: <ListViewIcon /> }
  ]}
/>
```

---

## SkipLink

**Import:** `import { SkipLink, SkipLinkContainer } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Navigation?id=skiplink

Accessibility skip links for keyboard navigation.

**Example:**

```jsx
<SkipLinkContainer>
  <SkipLink href="#main-content">Skip to main content</SkipLink>
  <SkipLink href="#navigation">Skip to navigation</SkipLink>
</SkipLinkContainer>
```
