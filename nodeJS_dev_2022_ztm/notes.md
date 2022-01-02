# Notes for Complete NodeJS Developer in 2022 Course

## Link to Course on Udemy

https://www.udemy.com/course/complete-nodejs-developer-zero-to-mastery/

## Course Projects + Code + Cheatsheet

### CHEATSHEET:

[https://zerotomastery.io/cheatsheets/node-js-cheat-sheet/?utm_source=udemy&utm_medium=coursecontent](https://zerotomastery.io/cheatsheets/node-js-cheat-sheet/?utm_source=udemy&utm_medium=coursecontent)

### Projects and Code:

All of the course projects and code at the below repositories:

https://github.com/odziem/planets-project

https://github.com/odziem/http-server

https://github.com/odziem/express-project

https://github.com/odziem/nasa-project

https://github.com/odziem/performance-example

https://github.com/odziem/security-example

https://github.com/odziem/graphql-example

https://github.com/odziem/multiplayer-pong

## More

### General

- Type `.exit` to exit node.
- Extensions for VS Code:
  - Visual Studio IntelliCode
- Emojies: https://getemoji.com/#animals-nature
- `require` looks for javascript files so you do not need to include the **.js**. see also `require.extensions`.

### Section 4

- CommonJS modules: https://nodejs.org/api/modules.html#modules_modules_commonjs_modules
- ESM `import`: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import
- ESM `export`: https://developer.mozilla.org/en-US/docs/web/javascript/reference/statements/export
- Ryan Dahl's - _10 things I regret about Node.js_: https://www.youtube.com/watch?v=M3BM9TB-8yA
- How the `require` function finds modules: https://nodejs.org/api/modules.html#modules_all_together

### Section 5

- Node Package Manager website: https://www.npmjs.com/
- type `npm init -y` to initialize a package folder with defaults
- Semantic Versioning: MAJOR.MINOR.PATCH - https://semver.org/
  1. MAJOR version when you make incompatible API changes,
  2. MINOR version when you add functionality in a backwards compatible manner, and
  3. PATCH version when you make backwards compatible bug fixes.
- npm semantic version calculator: https://semver.npmjs.com/
  - for a 0 MAJOR version, then the the MINOR becomes the MAJOR.
- `nodemon` monitors for changes.
- **In general, Don't install NPM Packages Glocally**

### Section 22 (async JS):

- `catch` statement will only run if error occurs in code before it.
- link to https://jsonplaceholder.typicode.com
- solution to `ReferenceError: fetch is not defined` is at this stack overflow link: https://stackoverflow.com/questions/48433783/referenceerror-fetch-is-not-defined (the `fetch` API is not implemented in NodeJS).
- **NEED TO LEARN MORE ABOUT ASYNC-AWAIT IN NODEJS AND JS**
