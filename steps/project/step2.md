

## Cells Environment

This is the list of things you need to have the Cells Environment ready:

### Access to Cells Repositories

The first thing to do is ask access to repositories needed to work with Cells.

To work with Cells you will need to access to the defaults bitbucket cells projects, as for example:

- [BBVA_Global_Cells](https://globaldevtools.bbva.com/bitbucket/projects/CEL)
- [BBVA_Global_Cells_Atom](https://globaldevtools.bbva.com/bitbucket/projects/CA)
- [BBVA_Global_Cells_Molecules](https://globaldevtools.bbva.com/bitbucket/projects/BGCM)
- [BBVA_Global_Cells_Organism](https://globaldevtools.bbva.com/bitbucket/projects/BGCM)
- [BBVA_Global_Cells_Tooling](https://globaldevtools.bbva.com/bitbucket/projects/BGCM)


The Jira's page to ask this is [Ether Platform Help Desk](https://globaldevtools.bbva.com/jira/servicedesk/customer/portal/7).
Create a "Access request" and ask access to repositories needed to work with Cells.

[Reference](https://bbva-devplatform.appspot.com/en-us/developers/engines/cells/documentation/governance/support/bitbucket)

### Bitbucket Support

Consider a header component that includes a page title: The DOM tree for this element might look like this:

```html
  <my-header>
    <header>
      <h1>
      </h1>
    </header>
  </my-header>
```
Shadow DOM lets you place the children in a scoped subtree, so document-level CSS can't restyle the tag < h1 > by accident, for example. This subtree is called a shadow tree.

```html
  <my-header>
    #shadow-root (open)
    <style scope="my-header"></style>
    <header>
      <h1>
      </h1>
    </header>
  </my-header>
```
The shadow root has a host property that identifies its host element.

## Light DOM
By default, if an element has shadow DOM, the shadow tree is rendered instead of the element's children. To allow children to render, you can add a <slot> element to your shadow tree. Think of the <slot> as a placeholder showing where child nodes will render.

```html
  <my-header>
    #shadow-root (open)
    <style></style>
    <header>
      <h1>
        <slot></slot>
      </h1>
    </header>
  </my-header>
```
The user can add children like this:
```html
  <my-header>I'm light DOM</my-header>
```
The header renders as if the <slot> element was replaced by the children:
```html
  <my-header>
    #shadow-root (open)
    <style></style>
    <header>
      <h1>I'm light DOM</h1>
    </header>
  </my-header>
```
The element's actual descendant tree is sometime called its light DOM, in contrast to its shadow DOM tree.

The process of turning the light DOM and shadow DOM trees into a single tree for rendering is called flattening the tree. While the <slot> elements don't render, they are included in the flattened tree, so they can take part in event bubbling, for example
