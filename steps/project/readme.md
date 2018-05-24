# Cells Code Labs

This repository includes all of the Code Labs for Cells training.

Each subfolder contains a code lab. If you want to create a new code lab follow these steps: 

0. If you don't have Polymer CLI tool, please install it with:
`npm install -g polymer-cli`
Note: Polymer CLI needs node 6.x.
1. Clone this repo.
2. Copy the `code_lab_seed` folder. It has the folder structure and all the files that you'll need.
3. Rename the newly created folder with the name of your code lab.
4. Open a terminal console, go to your folder and install the dependencies: 
  `bower install`.
5. Write your code lab. You will only have to write each step in a separted markdown file. Optionally you can write the step in an HTML file.
  👉🏼 The step files must be in the folder ./steps.
6. Add your step to the `index.html`. The `index.html` has Polymer elements used to write code labs and steps.
  You will see something like this:

```html
<body unresolved>
  <google-codelab title="CODE LAB TITLE"
                  feedback-link=""
                  environment="web"
                  last-updated="2018-07-18">
    <!-- Example using markdown -->
    <!-- google-codelab-step label="Overview" duration="5">
      <marked-element>
        <div slot="markdown-html"></div>
        <script type="text/markdown" src="steps/intro.md"></script>
      </marked-element>
    </google-codelab-step-->
    <!-- Example using html -->
    <!--google-codelab-step label="Setup" duration="8">
      <imported-template href="steps/setup.html"></imported-template>
    </google-codelab-step-->
  </google-codelab>
</body>
```
The component `<google-codelab>` is the main component that represents the whole code lab. Set its properties for your code lab:
* title: the title of the code lab
* feedback: it could have a mail address so that people can give you feedback about the tutorial
* las-updated: the date of the last modification.

Inside `<google-codelab>` you'll place each step. One step is defined using the `<google-codelab-step>` component. For each step set the properties:
* label: the title of the step
* duration: the stimated number of minutes that the user will need to finish the step.

If your step is in a markdown file use this snippet inside <google-codelab-step> tag (changing the src property so that it refers to your `.md` file):
```html
    <google-codelab-step label="Setup" duration="8">
      <marked-element>
        <div slot="markdown-html"></div>
        <script type="text/markdown" src="steps/intro.md"></script>
      </marked-element>
    </google-codelab-step>
​````
If you are using an `.html` file for the step, use this snippet (changing the href property so that it refers to your `.html` file):
​```html
    <google-codelab-step label="Setup" duration="8">
        <imported-template href="steps/setup.html"></imported-template>
    </google-codelab-step>
```
7. Test it. Use `polymer serve` and open the code lab in your browser to see how it works.
8. Is everything OK? So commit your changes and push them to the remote repo.

## Custom markdown tags

You can use custom markdown tags to display blocks of text with different background and text color.

Warning block (orange background):

```html
[warning]Your warning text[/warning]
```

Info block (blue background):

```html
[info]Some info text[/info]
```

Tip block (green background):

```html
[tip]Some tip text[/tip]
```

## Embedded JSFiddle code samples

Use the following tag in markdown to render a JSFiddle iframe:

```html
[jsfiddle 
  url=//jsfiddle.net/user/4fpbLy3h/embedded/ 
  height=500]
```

The height param is optional. Default value is 300.

That's all!😉


