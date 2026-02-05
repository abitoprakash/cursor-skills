#!/usr/bin/env python3
"""
analyze-components.py
Analyzes prism-ui components and generates documentation files.

Usage: python analyze-components.py <prism-ui-path> <output-dir> <version>
"""

import os
import re
import json
import sys
from pathlib import Path
from typing import Dict, List, Optional, Tuple
from dataclasses import dataclass, asdict

@dataclass
class ComponentProp:
    name: str
    type: str
    required: bool
    description: str = ""

@dataclass
class ComponentInfo:
    name: str
    category: str
    props: List[ComponentProp]
    accessibility_notes: List[str]
    storybook_url: str
    import_statement: str
    examples: List[str]

# Component category mapping
CATEGORY_MAP = {
    "Button": "actions",
    "ButtonGroup": "actions",
    "Dropdown": "actions",
    "RightClickProvider": "actions",
    
    "Input": "data-input",
    "TextInput": "data-input",
    "InputNumber": "data-input",
    "InputPassword": "data-input",
    "InputAddon": "data-input",
    "Select": "data-input",
    "MultiSelect": "data-input",
    "MultiSelectInput": "data-input",
    "MultiSelectDropdown": "data-input",
    "SelectDropdown": "data-input",
    "Checkbox": "data-input",
    "Radio": "data-input",
    "RadioGroup": "data-input",
    "Slider": "data-input",
    "TextArea": "data-input",
    "DatePicker": "data-input",
    "DatePickerMini": "data-input",
    "TimePicker": "data-input",
    "FileInput": "data-input",
    "CodeInput": "data-input",
    "MultiInput": "data-input",
    "Favorite": "data-input",
    "Sorter": "data-input",
    
    "Form": "forms",
    "FormItemInput": "forms",
    "FormItemSelect": "forms",
    "FormItemTextArea": "forms",
    "FormItemDatePicker": "forms",
    "FormItemTimePicker": "forms",
    "FormItemCodeInput": "forms",
    "FormItemInputPassword": "forms",
    "FormSection": "forms",
    "FormLayout": "forms",
    
    "Table": "tables",
    "LocalTable": "tables",
    "WidgetTable": "tables",
    
    "Title": "typography",
    "Paragraph": "typography",
    "Link": "typography",
    "TextLabel": "typography",
    
    "FlexLayout": "layouts",
    "FlexItem": "layouts",
    "StackingLayout": "layouts",
    "ContainerLayout": "layouts",
    "Modal": "layouts",
    "ModalContent": "layouts",
    "ModalWrap": "layouts",
    "ModalHeader": "layouts",
    "ConfirmModal": "layouts",
    "FullPageModal": "layouts",
    "SidePanel": "layouts",
    "Overlay": "layouts",
    "Accordion": "layouts",
    "Divider": "layouts",
    "Separator": "layouts",
    "VerticalSeparator": "layouts",
    "HeaderFooterLayout": "layouts",
    "LeftNavLayout": "layouts",
    "MainPageLayout": "layouts",
    "AlertLayout": "layouts",
    "TextGroup": "layouts",
    "Popover": "layouts",
    "PopoverContent": "layouts",
    "OldPopover": "layouts",
    
    "Tabs": "navigation",
    "TabItem": "navigation",
    "Menu": "navigation",
    "MenuItem": "navigation",
    "MenuGroup": "navigation",
    "MenuController": "navigation",
    "Breadcrumb": "navigation",
    "BreadcrumbItem": "navigation",
    "Steps": "navigation",
    "StepItem": "navigation",
    "Pagination": "navigation",
    "Anchor": "navigation",
    "AnchorLink": "navigation",
    "ViewSwitcher": "navigation",
    "NavBarLayout": "navigation",
    "SiteMap": "navigation",
    "SkipLink": "navigation",
    "SkipLinkContainer": "navigation",
    
    "Alert": "data-display",
    "Badge": "data-display",
    "StatusIcon": "data-display",
    "Tooltip": "data-display",
    "OldTooltip": "data-display",
    "Progress": "data-display",
    "Loader": "data-display",
    "Calendar": "data-display",
    "Carousel": "data-display",
    "OrderedList": "data-display",
    "UnorderedList": "data-display",
    
    "FocusTrap": "utility",
    "PortalProvider": "utility",
    "Truncate": "utility",
    "SrOnly": "utility",
    "InfiniteScroll": "utility",
    "Notification": "utility",
    "NotificationItem": "utility",
    "NotificationTrigger": "utility",
    "FileUploadProvider": "utility",
    "FormItemProvider": "utility",
    "InputWidthProvider": "utility",
    "PopupProvider": "utility",
    "TransitionLayoutProvider": "utility",
    "Tutorial": "utility",
    "TutorialManager": "utility",
    "TutorialMouse": "utility",
    "TutorialTip": "utility",
    "TreeView": "utility",
    "TreeItemCheckbox": "utility",
    "Scrollbar": "utility",
    
    "Dashboard": "dashboard",
    "DashboardWidgetHeader": "dashboard",
    "DashboardWidgetLayout": "dashboard",
}

# Storybook URL mapping
STORYBOOK_URLS = {
    "actions": "/Components/Actions?id=",
    "data-input": "/Components/Data%20Input?id=",
    "forms": "/Components/Form?id=",
    "tables": "/Components/Table?id=",
    "typography": "/Components/Typography?id=",
    "layouts": "/Layouts/Structure?id=",
    "navigation": "/Layouts/Navigation?id=",
    "data-display": "/Components/Data%20Display?id=",
    "utility": "/Higher-Order%20Components?id=",
    "dashboard": "/Layouts/Dashboard?id=",
    "icons": "/Icons/Overview",
}

def extract_props_from_interface(content: str, interface_name: str) -> List[ComponentProp]:
    """Extract props from a TypeScript interface definition."""
    props = []
    
    # Find the interface block
    pattern = rf'interface\s+{interface_name}\s*(?:extends[^{{]+)?\s*\{{([^}}]+)\}}'
    match = re.search(pattern, content, re.DOTALL)
    
    if not match:
        return props
    
    interface_body = match.group(1)
    
    # Parse each prop line
    prop_pattern = r"(?:/\*\*([^*]+)\*/\s*)?(\w+)(\?)?:\s*([^;,\n]+)"
    for match in re.finditer(prop_pattern, interface_body):
        description = match.group(1).strip() if match.group(1) else ""
        name = match.group(2)
        required = match.group(3) is None
        prop_type = match.group(4).strip()
        
        # Skip internal props
        if name.startswith('_'):
            continue
            
        props.append(ComponentProp(
            name=name,
            type=prop_type,
            required=required,
            description=description
        ))
    
    return props

def extract_accessibility_notes(examples_content: str) -> List[str]:
    """Extract accessibility-related notes from examples.md content."""
    notes = []
    
    # Look for accessibility badges/sections
    if "Accessibility" in examples_content:
        # Extract content near accessibility mentions
        lines = examples_content.split('\n')
        in_a11y_section = False
        
        for i, line in enumerate(lines):
            if 'Accessibility' in line or 'aria-' in line.lower():
                in_a11y_section = True
                
            if in_a11y_section:
                # Clean up the line
                clean_line = re.sub(r'```[^`]*```', '', line)
                clean_line = re.sub(r'<[^>]+>', '', clean_line)
                clean_line = clean_line.strip()
                
                if clean_line and not clean_line.startswith('import') and not clean_line.startswith('//'):
                    notes.append(clean_line)
                    
                if clean_line == '' and in_a11y_section:
                    in_a11y_section = False
    
    return notes[:10]  # Limit to first 10 notes

def extract_code_examples(examples_content: str) -> List[str]:
    """Extract JSX code examples from examples.md content."""
    examples = []
    
    # Find code blocks
    pattern = r'```jsx\s*\n(.*?)```'
    matches = re.findall(pattern, examples_content, re.DOTALL)
    
    for match in matches[:3]:  # Limit to first 3 examples
        # Clean up the example
        example = match.strip()
        if len(example) < 500:  # Only include short examples
            examples.append(example)
    
    return examples

def analyze_component(component_dir: Path) -> Optional[ComponentInfo]:
    """Analyze a single component directory."""
    component_name = component_dir.name
    
    # Skip non-component directories
    if component_name in ['__snapshots__', 'v2', 'styles', 'utils']:
        return None
    
    # Find the main component file
    tsx_file = component_dir / f"{component_name}.tsx"
    if not tsx_file.exists():
        # Try finding any .tsx file
        tsx_files = list(component_dir.glob("*.tsx"))
        tsx_files = [f for f in tsx_files if not f.name.endswith('.spec.tsx')]
        if tsx_files:
            tsx_file = tsx_files[0]
        else:
            return None
    
    # Read component file
    try:
        content = tsx_file.read_text()
    except:
        return None
    
    # Find props interface
    props_interface = f"{component_name}Props"
    props = extract_props_from_interface(content, props_interface)
    
    # Read examples file for accessibility notes
    examples_file = component_dir / f"{component_name}.examples.md"
    accessibility_notes = []
    examples = []
    
    if examples_file.exists():
        try:
            examples_content = examples_file.read_text()
            accessibility_notes = extract_accessibility_notes(examples_content)
            examples = extract_code_examples(examples_content)
        except:
            pass
    
    # Determine category
    category = CATEGORY_MAP.get(component_name, "utility")
    
    # Build storybook URL
    base_url = STORYBOOK_URLS.get(category, "/Components?id=")
    storybook_url = f"http://prism-styleguide/v2/#{base_url}{component_name.lower()}"
    
    return ComponentInfo(
        name=component_name,
        category=category,
        props=props,
        accessibility_notes=accessibility_notes,
        storybook_url=storybook_url,
        import_statement=f"import {{ {component_name} }} from '@nutanix-ui/prism-reactjs'",
        examples=examples
    )

def analyze_all_components(prism_ui_path: str) -> Dict[str, List[ComponentInfo]]:
    """Analyze all components and group by category."""
    components_dir = Path(prism_ui_path) / "services" / "src" / "components" / "v2"
    
    if not components_dir.exists():
        print(f"Error: Components directory not found: {components_dir}")
        sys.exit(1)
    
    # Group components by category
    categorized: Dict[str, List[ComponentInfo]] = {}
    
    for component_dir in components_dir.iterdir():
        if component_dir.is_dir():
            info = analyze_component(component_dir)
            if info:
                if info.category not in categorized:
                    categorized[info.category] = []
                categorized[info.category].append(info)
    
    return categorized

def generate_category_markdown(category: str, components: List[ComponentInfo]) -> str:
    """Generate markdown documentation for a category."""
    lines = [f"# {category.replace('-', ' ').title()} Components\n"]
    
    for comp in sorted(components, key=lambda x: x.name):
        lines.append(f"## {comp.name}\n")
        lines.append(f"**Import:** `{comp.import_statement}`\n")
        lines.append(f"**Storybook:** {comp.storybook_url}\n")
        
        if comp.props:
            lines.append("\n**Key Props:**")
            for prop in comp.props[:10]:  # Limit props shown
                required = " (required)" if prop.required else ""
                lines.append(f"- `{prop.name}`: {prop.type}{required}")
        
        if comp.accessibility_notes:
            lines.append("\n**Accessibility:**")
            for note in comp.accessibility_notes[:5]:
                lines.append(f"- {note}")
        
        if comp.examples:
            lines.append("\n**Example:**")
            lines.append("```jsx")
            lines.append(comp.examples[0][:300])  # Truncate long examples
            lines.append("```")
        
        lines.append("")
    
    return "\n".join(lines)

def main():
    if len(sys.argv) < 3:
        print("Usage: python analyze-components.py <prism-ui-path> <output-dir> [version]")
        sys.exit(1)
    
    prism_ui_path = sys.argv[1]
    output_dir = Path(sys.argv[2])
    version = sys.argv[3] if len(sys.argv) > 3 else "unknown"
    
    output_dir.mkdir(parents=True, exist_ok=True)
    
    print(f"Analyzing prism-ui at: {prism_ui_path}")
    
    # Analyze all components
    categorized = analyze_all_components(prism_ui_path)
    
    # Generate category files
    components_dir = output_dir / "components"
    components_dir.mkdir(exist_ok=True)
    
    for category, components in categorized.items():
        markdown = generate_category_markdown(category, components)
        output_file = components_dir / f"{category}.md"
        output_file.write_text(markdown)
        print(f"Generated: {output_file}")
    
    # Generate summary JSON
    summary = {
        "version": version,
        "categories": {
            cat: [asdict(c) for c in comps]
            for cat, comps in categorized.items()
        }
    }
    
    summary_file = output_dir / "components-summary.json"
    summary_file.write_text(json.dumps(summary, indent=2))
    print(f"Generated: {summary_file}")
    
    print(f"\nAnalysis complete! Total components: {sum(len(c) for c in categorized.values())}")

if __name__ == "__main__":
    main()
