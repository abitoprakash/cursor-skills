# Icons

Prism UI includes 200+ icon components for various use cases.

## Import

Import icons individually:

```jsx
import { 
  PlusIcon, 
  EditIcon, 
  CloseIcon,
  ChevronDownIcon 
} from '@nutanix-ui/prism-reactjs';
```

**Storybook:** http://prism-styleguide/v2/#/Icons/Overview

## Icon Props

| Prop | Type | Description |
|------|------|-------------|
| `size` | `string` | 'small', 'medium' (default), 'large' |
| `aria-hidden` | `boolean` | Hide from screen readers (decorative icons) |
| `aria-label` | `string` | Accessible label (informative icons) |

## Usage Guidelines

### Decorative Icons (Most Common)

Icons that accompany text and don't add meaning:

```jsx
<Button>
  <PlusIcon size="small" aria-hidden="true" /> Create VM
</Button>
```

### Informative Icons

Icons that convey meaning on their own:

```jsx
<StatusIcon
  type={StatusIcon.StatusIconTypes.WARNING}
  aria-hidden="false"
  aria-label="Warning: Action required"
/>
```

### Icon-Only Buttons

Always provide aria-label:

```jsx
<Button aria-label="Delete item">
  <CloseIcon aria-hidden="true" />
</Button>
```

## Common Icons by Category

### Actions

| Icon | Component | Usage |
|------|-----------|-------|
| Add/Create | `PlusIcon`, `PlusCircleIcon` | Add new items |
| Edit | `EditIcon` | Edit actions |
| Delete | `CloseIcon`, `RemoveIcon`, `MinusCircleIcon` | Remove items |
| Save | `SaveIcon` | Save actions |
| Refresh | `RefreshIcon` | Reload/refresh |
| Download | `DownloadIcon` | Download files |
| Upload | `UploadIcon` | Upload files |
| Clone | `CloneIcon` | Duplicate items |

### Navigation

| Icon | Component | Usage |
|------|-----------|-------|
| Chevron Down | `ChevronDownIcon` | Dropdowns, expand |
| Chevron Up | `ChevronUpIcon` | Collapse |
| Chevron Right | `ChevronRightIcon` | Navigate forward |
| Chevron Left | `ChevronLeftIcon` | Navigate back |
| Back | `BackIcon` | Back navigation |
| External Link | `ExternalLinkIcon` | Opens in new tab |
| Home | `HomeIcon` | Home navigation |

### Status

| Icon | Component | Usage |
|------|-----------|-------|
| Success | `SuccessStatusIcon`, `TickCircleIcon`, `SuccessSquareIcon` | Success state |
| Warning | `WarningStatusIcon`, `WarningSquareIcon` | Warning state |
| Error | `CrossCircleIcon`, `ErrorSquareIcon` | Error state |
| Info | `InformationStatusIcon`, `InformationSquareIcon` | Information |
| Question | `QuestionIcon`, `QuestionSquareIcon`, `QuestionStatusIcon` | Help/unknown |

### UI Elements

| Icon | Component | Usage |
|------|-----------|-------|
| Menu | `MenuIcon`, `TripleDotHorizontalIcon` | Menu trigger |
| Settings | `SettingsIcon` | Settings/configuration |
| Search | `MagGlassIcon` | Search actions |
| Filter | `FilterIcon` | Filter controls |
| Sort | `SortByIcon` | Sorting |
| Grid View | `GridViewIcon` | Grid layout |
| List View | `ListViewIcon` | List layout |
| Show | `ShowIcon` | Visibility on |
| Hide | `HideIcon` | Visibility off |

### Resources

| Icon | Component | Usage |
|------|-----------|-------|
| VM | `VMIcon`, `DoubleVMIcon`, `TripleVMIcon` | Virtual machines |
| Storage | `StorageIcon` | Storage resources |
| Network | `ConnectIcon`, `DisconnectIcon` | Network |
| User | `UserIcon` | Users/accounts |
| Lock | `LockIcon`, `SecureIcon` | Security/locked |
| Unlock | `UnlockIcon`, `UnsecureIcon` | Unlocked |
| Calendar | `DateIcon` | Dates |
| Time | `TimeIcon` | Time |

### Product Logos

| Icon | Component | Usage |
|------|-----------|-------|
| Prism | `PrismLogoIcon` | Prism product |
| Calm | `CalmLogoIcon` | Calm product |
| Era | `EraLogoIcon` | Era product |
| Files | `FilesLogoIcon` | Files product |
| Flow | `FlowLogoIcon` | Flow product |
| Karbon | `KarbonLogoIcon` | Karbon product |
| Objects | `ObjectsLogoIcon` | Objects product |

## Icon Sizes

```jsx
// Small - for inline with text, buttons
<PlusIcon size="small" />

// Medium (default) - standard size
<EditIcon />  // or size="medium"

// Large - for emphasis
<WarningStatusIcon size="large" />
```

## Examples

### Button with Icon

```jsx
<Button>
  <PlusIcon size="small" aria-hidden="true" /> Create VM
</Button>

<Button type={Button.ButtonTypes.SECONDARY}>
  <DownloadIcon aria-hidden="true" /> Export
</Button>
```

### Icon Button

```jsx
<Tooltip content="Edit settings" oldTooltip={false}>
  <Button aria-label="Edit settings" type={Button.ButtonTypes.ICON_SECONDARY}>
    <EditIcon aria-hidden="true" />
  </Button>
</Tooltip>
```

### Status with Icon

```jsx
<FlexLayout alignItems="center" itemSpacing="5px">
  <StatusIcon type={StatusIcon.StatusIconTypes.SUCCESS} />
  <span>Running</span>
</FlexLayout>
```

### Link with Icon

```jsx
<Link type="with-icon" icon={<ExternalLinkIcon />} href="https://docs.example.com">
  View Documentation
</Link>
```

### Menu Item with Icon

```jsx
<Menu>
  <MenuItem key="edit" icon={<EditIcon />}>Edit</MenuItem>
  <MenuItem key="clone" icon={<CloneIcon />}>Clone</MenuItem>
  <MenuItem key="delete" icon={<RemoveIcon />}>Delete</MenuItem>
</Menu>
```

## Full Icon List

For the complete list of available icons, visit the Storybook Icons Overview:
http://prism-styleguide/v2/#/Icons/Overview

You can search and preview all icons in the storybook interface.
