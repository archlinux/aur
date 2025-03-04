const fs = require('fs');
const path = require('path');
const webpack = require('webpack');
const buildConfig = require('../resources/build/cfg/build.json');
const main = require('./webpack.main.config');
const renderer = require('./webpack.renderer.config');
const bytecode = require('./buildCode');
const arch = 'linux';
const archPath = 'platform/linux';
function deleteFolderRecursive(url) {
  if (fs.existsSync(url)) {
    const files = fs.readdirSync(url);
    files.forEach(file => {
      const curPath = path.join(url, file);
      fs.statSync(curPath).isDirectory() 
        ? deleteFolderRecursive(curPath)
        : fs.unlinkSync(curPath);
    });
    fs.rmdirSync(url);
  }
}
buildConfig.extraResources = [{
  from: 'resources/extern',
  to: 'extern/',
  filter: ['**/*']
}];
try {
  fs.accessSync(path.resolve('./resources/' + archPath));
  buildConfig.extraResources.push({
    from: 'resources/' + archPath,
    to: archPath,
    filter: ['**/*']
  });
} catch (err) {}
async function build() {
  deleteFolderRecursive(path.resolve('dist'));
  fs.writeFileSync('./resources/build/cfg/build.json', JSON.stringify(buildConfig, null, 2));
  await Promise.all([
    new Promise((resolve, reject) => {
      webpack([main('production')], (err, stats) => {
        err || stats.hasErrors() ? reject(err) : resolve();
      });
    }),
    new Promise((resolve, reject) => {
      webpack([renderer('production')], (err, stats) => {
        err || stats.hasErrors() ? reject(err) : resolve();
      });
    })
  ]);
  await bytecode();
}
build().then(() => {
  console.log('Build completed');
  process.exit(0);
}).catch(err => {
  console.error(err);
  process.exit(1);
});