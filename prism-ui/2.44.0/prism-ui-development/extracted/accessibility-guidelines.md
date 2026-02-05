# Overview

The Prism ReactJs component library has been evaluated and updated to meet [WCAG 2.1, Level AA](https://www.w3.org/WAI/WCAG22/quickref/?versions=2.1&currentsidebar=%23col_customize&levels=aaa) standards—the minimum technical requirement for accessibility. It is continuously maintained and improved to enhance accessibility across components.

Accessibility is a core principle of our design and development process. By designing and building accessible products, we are enhancing the usability for all customers, including those with low vision, blindness, hearing impairments, cognitive disabilities, motor impairments, or situational disabilities (like an injured arm or hand).

The Prism ReactJS (PRJS) component library serves as the primary UI framework for our product portfolio. Built-in accessibility standards provide a strong foundation for inclusive UX and design. Prioritizing accessibility from the start of product and feature development helps reduce redesign, technical debt, and resource overhead.

For the best accessibility support, always use the latest version of the PRJS component library. Designers and engineers should also review component-specific accessibility documentation to ensure best practices are followed.

## Structure, Hierarchy, and Navigation

A well-structured and semantically correct UI ensures that screen reader and keyboard users can navigate content efficiently. Proper document hierarchy, semantic HTML, and focus management contribute to an accessible and intuitive experience.

### Best Practices

- Use semantic HTML
  - Elements like `<button>`, `<nav>`, `<header>`, `<section>`, and `<main>` provide built-in accessibility benefits and should be used instead of generic `<div>` or `<span>` elements.
- Follow a logical heading structure. Headings should be used sequentially to create a clear page outline.
- Avoid skipping heading levels, as screen readers rely on them for navigation.
- Ensure a predictable focus order: Interactive elements should follow a logical sequence in the DOM to avoid confusing keyboard users.
- Use ARIA landmarks when necessary
  - `<main>`, `<nav>`, `<aside>,` and `<footer>` define key sections of the page, reducing the need for extra ARIA roles.
  - If custom elements are used, apply ARIA roles appropriately (e.g., role="navigation" for a custom menu).
- Avoid unnecessary nesting
  - Deeply nested elements can make navigation cumbersome for assistive technologies.
  - Keep the DOM structure as simple and meaningful as possible.

## Tab Index

Keyboard navigation is essential for accessibility, and the correct use of tabindex ensures a logical and predictable focus order. While some components include an optional tabindex property, it is generally best to allow the browser to manage focus naturally.

### Guidelines for Using `tabindex`

- Only use tabindex when necessary—most interactive elements (e.g., buttons, links, inputs) are focusable by default.
- 'tabindex' should *never* be set to anything except 0 or -1.
  - A tabindex of 0 will make an element keyboard focusable in the normal tab order (based on the code order in the DOM). This is the default for interactive elements.
  - A tabindex of -1 will allow an element to receive focus if focus is sent there programmatically, but will not add it to the normal tab order (and will remove it from the normal tab order if it's an interactive element). This is often used for static elements that may need to receive focus for screen reader usability, such as modal headings. See the [Modal section on focus management](#!/Layouts/Sessions?id=modal:~:text=Managing%20keyboard%20focus) for a longer explanation of this technique.

## Icons

Icons play a key role in providing visual cues, but they must be used thoughtfully to ensure accessibility.

### Icons and 'aria-hidden'

- By default, all icons are hidden with `aria-hidden`.
- Interactive or focusable icons (such as those used as [buttons](#!/Components/Actions?id=button)) need an aria-label that describes the result of that action.
  - For instance, if you use the [Remove Icon](#!/Icons/All?id=removeicon) as a button that deletes an item the aria-label should be "delete item" not "trash can".
- Icons that convey information (such as the state of loading data) need to be available for screen readers. They should have aria-hidden set to false and have an aria-label that serves as a text alternative.

## Search and Filtering
Any time new content is displayed to users visually, it must also be made available for screen readers. So when a user preforms a search or filters a list of items, a loading announcement, the number of results, or a “Showing results for x” message is necessary to alert screen reader users that an action has been performed. This can be accomplished by adding an [ARIA Live region](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions) to the part of the page that contains the dynamically added content.

Note: if the search or filtering action takes the user to a new page or screen then ARIA Live is not needed. In that case, the search result page title (or modal label) should include something like "Search results for SEARCH TERM".

## Data Input and Forms
Every data input field must have a label. Labels should be concise, but include all information a user needs to successfully complete the action. Error/help text should be programmatically associated with the input if present. See [FormItemInput](http://prism-styleguide.eng.nutanix.com/v2/#/Components/Form?id=formiteminput) for examples.

### Label Requirements:
- unique, concise, and descriptive
- visually persistent
- programmatically connected to the input
- programmatic label must include the visual label exactly
- include any input requirements 

### Error Messages
- Error messages must be described to the user in text. Do not use color and icons alone. 
- Error messages should offer descriptive suggestions for correction so the user can make necessary changes to fix the problem. 

## Questions

If you have any questions or need guidance on accessibility best practices, please reach out through the following channels:

- [#prism-reactjs](https://nutanix.slack.com/archives/C8Y9JEGS1) Slack channel – For discussions related to the Prism ReactJS component library.
- [#a11y](https://nutanix.slack.com/archives/C066Y8XF5UK) Slack channel – For general accessibility questions and best practices.
- [a11y@nutanix.com](mailto:a11y@nutanix.com) – For accessibility-related inquiries that require direct support.

We encourage open discussions and collaboration to improve accessibility across our products!
