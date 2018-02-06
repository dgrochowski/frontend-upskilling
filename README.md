# frontend-upskilling
HTML, CSS, JavaScript, jQuery examples

# CSS
`box-sizing: padding-box` is not supported

# Webpack

### Setup environment
1. Install NodeJS: https://nodejs.org/en/download/
2. `npm init`
3. `npm install --save-dev webpack sass-loader css-loader html-loader style-loader html-webpack-plugin node-sass babel babel-core babel-loader babel-preset-env extract-text-webpack-plugin webpack-dev-server`
4. `touch webpack.config.js`
5. Fill **webpack.config.js** file by dependencies configuration
6. `mkdir src && touch src/index.js ...`
7. `npm run build`

### Use prepared environment
```bash
npm run build
```

### Use Webpack dev server
```bash
npm run start
```

and visit `localhost:8080`
