# Actions Components

Components for user actions and interactions.

## Button

**Import:** `import { Button } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Actions?id=button

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `type` | `ButtonTypes` | Visual style (PRIMARY, SECONDARY, DESTRUCTIVE, SUCCESS, WARNING) |
| `disabled` | `boolean` | Disables button, removes from tab order |
| `aria-disabled` | `boolean` | Disables but keeps focusable (for tooltips) |
| `count` | `number` | Shows badge with count |
| `fullWidth` | `boolean` | Button spans full width of parent |
| `appearance` | `string` | 'default', 'mini', 'transparent-mini' |

**Button Types:**
```jsx
Button.ButtonTypes.PRIMARY         // Blue filled (default)
Button.ButtonTypes.SECONDARY       // Outlined
Button.ButtonTypes.DESTRUCTIVE     // Red for dangerous actions
Button.ButtonTypes.SUCCESS         // Green
Button.ButtonTypes.WARNING         // Yellow
Button.ButtonTypes.BORDERLESS      // Deprecated, use SECONDARY with background
Button.ButtonTypes.ICON_DEFAULT    // For icon buttons
Button.ButtonTypes.ICON_SECONDARY  // For secondary icon buttons
Button.ButtonTypes.TEXT_PRIMARY    // Text link style
Button.ButtonTypes.TEXT_SECONDARY  // Secondary text link
```

**Accessibility:**
- All buttons need unique, descriptive labels
- Icon-only buttons require `aria-label`
- Use `aria-disabled` when you need tooltip on disabled state
- Never use both `disabled` and `aria-disabled` together

**Examples:**

```jsx
// Primary action
<Button type={Button.ButtonTypes.PRIMARY} onClick={handleCreate}>
  Create VM
</Button>

// Secondary action
<Button type={Button.ButtonTypes.SECONDARY} onClick={handleCancel}>
  Cancel
</Button>

// Destructive action
<Button type={Button.ButtonTypes.DESTRUCTIVE} onClick={handleDelete}>
  Delete
</Button>

// Icon button with aria-label
<Button aria-label="Edit settings" type={Button.ButtonTypes.ICON_SECONDARY}>
  <EditIcon aria-hidden="true" />
</Button>

// Button with count
<Button aria-label="Upgrade 3 VMs" count={3}>
  Upgrade
</Button>

// Button with icon
<Button>
  <PlusIcon size="small" aria-hidden="true" /> Create VM
</Button>
```

---

## ButtonGroup

**Import:** `import { ButtonGroup } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Actions?id=buttongroup

Groups multiple buttons together visually.

**Example:**

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

---

## Dropdown

**Import:** `import { Dropdown } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Actions?id=dropdown

**Key Props:**
| Prop | Type | Description |
|------|------|-------------|
| `popup` | `ReactNode` | Content to show in dropdown (usually Menu) |
| `visible` | `boolean` | Controlled visibility |
| `onVisibleChange` | `function` | Callback when visibility changes |
| `trigger` | `string[]` | Trigger events: 'click', 'hover' |
| `placement` | `string` | Position: 'bottomLeft', 'bottomRight', etc. |
| `getPopupContainer` | `function` | Where to mount popup DOM |

**Example:**

```jsx
const menu = (
  <Menu appearance={Menu.MenuAppearance.COMPACT}>
    <MenuItem key="edit">Edit</MenuItem>
    <MenuItem key="clone">Clone</MenuItem>
    <MenuItem key="delete">Delete</MenuItem>
  </Menu>
);

<Dropdown popup={menu} trigger={['click']}>
  <Button>
    Actions <ChevronDownIcon aria-hidden="true" />
  </Button>
</Dropdown>
```

---

## Menu

**Import:** `import { Menu, MenuItem, MenuGroup } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Layouts/Navigation?id=menu

**Key Props (Menu):**
| Prop | Type | Description |
|------|------|-------------|
| `appearance` | `MenuAppearance` | COMPACT or DEFAULT |
| `selectedKey` | `string` | Currently selected item key |
| `onSelect` | `function` | Callback when item selected |

**Key Props (MenuItem):**
| Prop | Type | Description |
|------|------|-------------|
| `key` | `string` | Unique identifier |
| `disabled` | `boolean` | Disables the item |
| `icon` | `ReactNode` | Icon to display |

**Example:**

```jsx
<Menu 
  appearance={Menu.MenuAppearance.COMPACT}
  onSelect={(key) => handleAction(key)}
>
  <MenuItem key="edit" icon={<EditIcon />}>Edit</MenuItem>
  <MenuItem key="clone" icon={<CloneIcon />}>Clone</MenuItem>
  <MenuGroup title="Danger Zone">
    <MenuItem key="delete" icon={<RemoveIcon />}>Delete</MenuItem>
  </MenuGroup>
</Menu>
```

---

## RightClickProvider

**Import:** `import { RightClickProvider } from '@nutanix-ui/prism-reactjs'`

**Storybook:** http://prism-styleguide/v2/#/Components/Actions?id=rightclickprovider

Provides context menu on right-click.

**Example:**

```jsx
<RightClickProvider
  popup={
    <Menu>
      <MenuItem key="copy">Copy</MenuItem>
      <MenuItem key="paste">Paste</MenuItem>
    </Menu>
  }
>
  <div>Right-click this area</div>
</RightClickProvider>
```
