# frontend-upskilling
Deployment to [Github pages](https://dgrochowski.github.io/frontend/) by Travis CI:

[![Build Status](https://travis-ci.org/dgrochowski/frontend-upskilling.svg?branch=master)](https://travis-ci.org/dgrochowski/frontend-upskilling)

HTML, CSS, JavaScript, jQuery examples

# CSS
`box-sizing: padding-box` is not supported

### Suit name convention
- utilities: `.u-clearfix`, `.u-cf`
- ComponentName: `.Component`, `.MyComponent`
- ComponentName-descendentName: `.Component-header`, `.Component-bodyText`
- ComponentName--modifierName: `.Component--default`, `.Component--primary`
- ComponentName.is-stateOfComponent: `.Component.is-blue`, `.MyComponent.is-blue`, `.Component.is-stateOfComponent`

# JavaScript
- Async vs Defer differences: https://bitsofco.de/async-vs-defer/
- undeclared, undefined, null
  - `undeclared` - variables don’t even exist
  - `undefined` - variables exist, but don’t have anything assigned to them
  - `null` - variables exist and have null assigned to them
- instead of `document.getElementsByClassName('className')[0].getElementsByTagName('tagName')` you can use: `document.querySelectorAll('.className tagName')`

# Webpack

### Setup environment
1. Install NodeJS: https://nodejs.org/en/download/
2. `npm init`
3. `npm install --save-dev webpack sass-loader css-loader html-loader style-loader file-loader html-webpack-plugin node-sass babel babel-core babel-loader babel-preset-env extract-text-webpack-plugin webpack-dev-server clean-webpack-plugin`
4. `touch webpack.config.js`
5. Fill **webpack.config.js** file by dependencies configuration
6. `mkdir webpack && touch webpack/index.js ...`
7. `npm run build`

### Use prepared environment
```bash
npm install
npm run build
```

### Use Webpack dev server
```bash
npm run start
```

and visit `localhost:8080`
