# Custom Markdown Tags

Allows to use custom markdown tags in markdown files used by `<marked-element>`.   

```html
<marked-element sanitize>
  <div slot="markdown-html"></div>
  <script type="text/markdown" src="path-to/file.md"></script>
</marked-element>
```


## Usage

1. Import `custom-markdown-tags.html` file.
2. Initialize the script:
```html
<script>
  document
    .querySelectorAll('marked-element')
    .forEach(item => item.renderer = CustomFormatter.formatter.bind(CustomFormatter)); 
</script>
```
3. Use custom markdow tags.
4. Optionally, include the provided style `aside-styles` in a `<custom-style>` element:
```html
<style is="custom-style" include="aside-styles">
  body {
    font-family: 'Roboto', 'Helvetica Neue', Helvetica, Arial;
    background: var(--google-codelab-background, --paper-grey-300);
  }
</style>
```

## Available tags

| Tag | Description |
|:----|:-------|
| `[warning]Your text[/warning]` | Renders a block of text (paragraph) with a **yellow background** inside an `<aside>` HTML element. |
| `[info]Your text[/info]` | Renders a block of text with a **blue background** inside an `<aside>` HTML element. |
| `[tip]Your text[/tip]` | Renders a block of text with a **green background** inside an `<aside>` HTML element. |
| `[notice]Your text[/notice]` | Renders a block of text with a **light yellow background** inside an `<aside>` HTML element. |
| `[jsfiddle url=your-js-fiddle-url height=500]` | Renders an embed with a JSFiddle URL and the height (optional) provided |
| `[Download something](http://.../.zip)` | Links to zip files that contains the text "download" are automatically rendered as green buttons with a download icon. |
| `[check]` | Renders a `<paper-checkbox>`. It's only rendered when the custom tags appears inside a list item element. |
