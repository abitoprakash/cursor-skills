# Figma to Component Mapping

This table maps visual elements commonly seen in Figma designs to their corresponding Prism UI components.

## Buttons & Actions

| Visual Element | Primary Component | Variants/Props | Storybook URL |
|---------------|-------------------|----------------|---------------|
| Primary button (blue filled) | `Button` | `type={Button.ButtonTypes.PRIMARY}` | `/Components/Actions?id=button` |
| Secondary button (outlined) | `Button` | `type={Button.ButtonTypes.SECONDARY}` | `/Components/Actions?id=button` |
| Destructive button (red) | `Button` | `type={Button.ButtonTypes.DESTRUCTIVE}` | `/Components/Actions?id=button` |
| Success button (green) | `Button` | `type={Button.ButtonTypes.SUCCESS}` | `/Components/Actions?id=button` |
| Warning button (yellow) | `Button` | `type={Button.ButtonTypes.WARNING}` | `/Components/Actions?id=button` |
| Text link button | `Button` | `type={Button.ButtonTypes.TEXT_PRIMARY}` | `/Components/Actions?id=button` |
| Icon-only button | `Button` | Add `aria-label`, icon as child | `/Components/Actions?id=button` |
| Button with badge count | `Button` | `count={number}` | `/Components/Actions?id=button` |
| Disabled button | `Button` | `disabled={true}` | `/Components/Actions?id=button` |
| Button group (joined) | `ButtonGroup` | Contains multiple `Button` | `/Components/Actions?id=buttongroup` |
| Dropdown menu trigger | `Dropdown` | `popup={<Menu>...}` | `/Components/Actions?id=dropdown` |

## Form Inputs

| Visual Element | Primary Component | Variants/Props | Storybook URL |
|---------------|-------------------|----------------|---------------|
| Text input | `Input` | - | `/Components/Data%20Input?id=input` |
| Text input with label | `FormItemInput` | `label`, `helpText` | `/Components/Form?id=formiteminput` |
| Password input | `InputPassword` | - | `/Components/Data%20Input?id=inputpassword` |
| Number input | `InputNumber` | `min`, `max`, `step` | `/Components/Data%20Input?id=inputnumber` |
| Text area (multiline) | `TextArea` | - | `/Components/Data%20Input?id=textarea` |
| Text area with label | `FormItemTextArea` | `label`, `helpText` | `/Components/Form?id=formitemtextarea` |
| Input with prefix/suffix | `Input` | `prefix`, `suffix` | `/Components/Data%20Input?id=input` |
| Input with addon | `InputAddon` | - | `/Components/Data%20Input?id=inputaddon` |
| Input with error state | `Input` / `FormItemInput` | `error={true}`, `errorText` | `/Components/Data%20Input?id=input` |
| Search input | `Input` | With `MagGlassIcon` as prefix | `/Components/Data%20Input?id=input` |
| Multiple value input | `MultiInput` | For tags/multiple entries | `/Components/Data%20Input?id=multiinput` |
| Code editor input | `CodeInput` | For code entry | `/Components/Data%20Input?id=codeinput` |

## Selection Controls

| Visual Element | Primary Component | Variants/Props | Storybook URL |
|---------------|-------------------|----------------|---------------|
| Dropdown select | `Select` | `rowsData` for options | `/Components/Data%20Input?id=select` |
| Select with label | `FormItemSelect` | `label`, `rowsData` | `/Components/Form?id=formitemselect` |
| Multi-select dropdown | `MultiSelect` | Multiple selection enabled | `/Components/Data%20Input?id=multiselect` |
| Checkbox | `Checkbox` | `checked`, `onChange` | `/Components/Data%20Input?id=checkbox` |
| Toggle switch | `Checkbox` | `type={Checkbox.CheckboxTypes.TOGGLE}` | `/Components/Data%20Input?id=checkbox` |
| Radio button | `Radio` | Inside `RadioGroup` | `/Components/Data%20Input?id=radio` |
| Radio button group | `RadioGroup` | `selectedValue`, `onChange` | `/Components/Data%20Input?id=radiogroup` |
| Slider | `Slider` | `min`, `max`, `value` | `/Components/Data%20Input?id=slider` |
| Date picker | `DatePicker` | - | `/Components/Data%20Input?id=datepicker` |
| Date picker with label | `FormItemDatePicker` | `label` | `/Components/Form?id=formitemdatepicker` |
| Time picker | `TimePicker` | - | `/Components/Data%20Input?id=timepicker` |
| File upload | `FileInput` | - | `/Components/Data%20Input?id=fileinput` |
| Favorite/Star toggle | `Favorite` | `selected`, `onChange` | `/Components/Data%20Input?id=favorite` |

## Layout Components

| Visual Element | Primary Component | Variants/Props | Storybook URL |
|---------------|-------------------|----------------|---------------|
| Horizontal row | `FlexLayout` | `alignItems`, `justifyContent` | `/Layouts/Structure?id=flexlayout` |
| Vertical stack | `StackingLayout` | `itemSpacing` | `/Layouts/Structure?id=stackinglayout` |
| Content box/card | `ContainerLayout` | `padding`, `backgroundColor`, `border` | `/Layouts/Structure?id=containerlayout` |
| Full-width divider | `Divider` | - | `/Layouts/Structure?id=divider` |
| Vertical separator | `VerticalSeparator` | - | `/Layouts/Structure?id=verticalseparator` |
| Side panel (drawer) | `SidePanel` | `visible`, `position` | `/Layouts/Structure?id=sidepanel` |
| Accordion/Collapsible | `Accordion` | - | `/Layouts/Structure?id=accordion` |
| Scrollable area | `Scrollbar` | - | `/Higher-Order%20Components?id=scrollbar` |

## Modal & Overlays

| Visual Element | Primary Component | Variants/Props | Storybook URL |
|---------------|-------------------|----------------|---------------|
| Modal dialog | `Modal` | `visible`, `title`, `footer` | `/Layouts/Sessions?id=modal` |
| Confirmation modal | `ConfirmModal` | `onConfirm`, `onCancel` | `/Layouts/Sessions?id=confirmmodal` |
| Full page modal | `FullPageModal` | - | `/Layouts/Sessions?id=fullpagemodal` |
| Popover | `Popover` | `content`, trigger as child | `/Layouts/Sessions?id=popover` |
| Overlay (backdrop) | `Overlay` | - | `/Layouts/Structure?id=overlay` |

## Navigation

| Visual Element | Primary Component | Variants/Props | Storybook URL |
|---------------|-------------------|----------------|---------------|
| Tab bar | `Tabs` | `activeKey`, `onTabClick` | `/Layouts/Navigation?id=tabs` |
| Tab item | `TabItem` | `tabKey`, `title` | `/Layouts/Navigation?id=tabitem` |
| Vertical menu | `Menu` | Contains `MenuItem` | `/Layouts/Navigation?id=menu` |
| Menu item | `MenuItem` | `key`, click handler | `/Layouts/Navigation?id=menuitem` |
| Menu group (with header) | `MenuGroup` | `title` | `/Layouts/Navigation?id=menugroup` |
| Breadcrumb trail | `Breadcrumb` | Contains `BreadcrumbItem` | `/Layouts/Navigation?id=breadcrumb` |
| Step wizard | `Steps` | Contains `StepItem` | `/Layouts/Navigation?id=steps` |
| Pagination | `Pagination` | `total`, `current`, `onChange` | `/Layouts/Navigation?id=pagination` |
| View switcher (grid/list) | `ViewSwitcher` | - | `/Layouts/Navigation?id=viewswitcher` |

## Data Display

| Visual Element | Primary Component | Variants/Props | Storybook URL |
|---------------|-------------------|----------------|---------------|
| Data table | `Table` | `columns`, `dataSource` | `/Components/Table?id=table` |
| Simple table (client-side) | `LocalTable` | `columns`, `dataSource` | `/Components/Table?id=localtable` |
| Widget table | `WidgetTable` | For dashboard widgets | `/Components/Table?id=widgettable` |
| Badge/Tag | `Badge` | `count`, `color` | `/Components/Data%20Display?id=badge` |
| Status icon | `StatusIcon` | `type` (SUCCESS, WARNING, ERROR, INFO) | `/Components/Data%20Display?id=statusicon` |
| Progress bar | `Progress` | `percent` | `/Components/Data%20Display?id=progress` |
| Loading spinner | `Loader` | `loading`, `tip` | `/Components/Data%20Display?id=loader` |
| Alert banner | `Alert` | `type`, `message` | `/Components/Data%20Display?id=alert` |
| Inline alert | `Alert` | `inline={true}` | `/Components/Data%20Display?id=alert` |
| Tooltip | `Tooltip` | `content`, `oldTooltip={false}` | `/Components/Data%20Display?id=tooltip` |
| Calendar view | `Calendar` | - | `/Components/Data%20Display?id=calendar` |
| Carousel/Slider | `Carousel` | - | `/Components/Data%20Display?id=carousel` |
| Ordered list | `OrderedList` | `data` array | `/Components/Data%20Display?id=orderedlist` |
| Unordered list | `UnorderedList` | `data` array | `/Components/Data%20Display?id=unorderedlist` |

## Typography

| Visual Element | Primary Component | Variants/Props | Storybook URL |
|---------------|-------------------|----------------|---------------|
| Page title (H1) | `Title` | `size="h1"` | `/Components/Typography?id=title` |
| Section title (H2-H4) | `Title` | `size="h2"`, `"h3"`, `"h4"` | `/Components/Typography?id=title` |
| Body paragraph | `Paragraph` | - | `/Components/Typography?id=paragraph` |
| Secondary text | `Paragraph` | `type="secondary"` | `/Components/Typography?id=paragraph` |
| Small label | `TextLabel` | `size="small"` | `/Components/Typography?id=textlabel` |
| Link | `Link` | `href` | `/Components/Typography?id=link` |
| Link with icon | `Link` | `type="with-icon"`, `icon` | `/Components/Typography?id=link` |
| Inline link | `Link` | `type="inline"` | `/Components/Typography?id=link` |

## Forms

| Visual Element | Primary Component | Variants/Props | Storybook URL |
|---------------|-------------------|----------------|---------------|
| Form container | `Form` | Wraps form content | `/Components/Form?id=form` |
| Form layout | `FormLayout` | Structures form sections | `/Layouts/Structure?id=formlayout` |
| Form section | `FormSection` | `title` | `/Components/Form?id=formsection` |
| Labeled input | `FormItemInput` | `label`, `id` | `/Components/Form?id=formiteminput` |
| Labeled select | `FormItemSelect` | `label`, `id` | `/Components/Form?id=formitemselect` |
| Labeled textarea | `FormItemTextArea` | `label`, `id` | `/Components/Form?id=formitemtextarea` |
| Labeled date picker | `FormItemDatePicker` | `label`, `id` | `/Components/Form?id=formitemdatepicker` |
| Labeled time picker | `FormItemTimePicker` | `label`, `id` | `/Components/Form?id=formitemtimepicker` |

## Utility Components

| Visual Element | Primary Component | Variants/Props | Storybook URL |
|---------------|-------------------|----------------|---------------|
| Focus trap (for modals) | `FocusTrap` | Wraps focusable content | `/Higher-Order%20Components?id=focustrap` |
| Portal (for dropdowns) | `PortalProvider` | - | `/Higher-Order%20Components?id=portalprovider` |
| Text truncation | `Truncate` | - | `/Higher-Order%20Components?id=truncate` |
| Screen reader only | `SrOnly` | For a11y text | `/Higher-Order%20Components?id=sronly` |
| Infinite scroll | `InfiniteScroll` | `onLoadMore` | `/Higher-Order%20Components?id=infinitescroll` |
| Toast notification | `Notification` | - | `/Higher-Order%20Components?id=notification` |
| Tutorial overlay | `Tutorial` | For onboarding | `/Higher-Order%20Components?id=tutorial` |
| Tree view | `TreeView` | For hierarchical data | `/Higher-Order%20Components?id=treeview` |

## Common Icon Mapping

| Visual/Purpose | Icon Component |
|---------------|----------------|
| Add/Create | `PlusIcon`, `PlusCircleIcon` |
| Edit | `EditIcon` |
| Delete/Remove | `CloseIcon`, `RemoveIcon`, `MinusCircleIcon` |
| Settings | `SettingsIcon` |
| Search | `MagGlassIcon` |
| Filter | `FilterIcon` |
| Sort | `SortByIcon` |
| Download | `DownloadIcon` |
| Upload | `UploadIcon` |
| Refresh | `RefreshIcon` |
| External link | `ExternalLinkIcon` |
| Expand/Collapse | `ChevronDownIcon`, `ChevronUpIcon` |
| Navigate | `ChevronRightIcon`, `ChevronLeftIcon` |
| Success | `SuccessStatusIcon`, `TickCircleIcon` |
| Warning | `WarningStatusIcon`, `WarningSquareIcon` |
| Error | `CrossCircleIcon`, `ErrorSquareIcon` |
| Info | `InformationStatusIcon`, `InformationSquareIcon` |
| Question/Help | `QuestionIcon`, `QuestionSquareIcon` |
| User | `UserIcon` |
| Home | `HomeIcon` |
| Calendar/Date | `DateIcon` |
| Time | `TimeIcon` |
| Lock/Secure | `LockIcon`, `SecureIcon` |
| Unlock | `UnlockIcon`, `UnsecureIcon` |
