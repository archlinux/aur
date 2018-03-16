const nwjsBuilder = require('nwjs-builder-phoenix');
const fs = require('fs-extra');

const builder = new nwjsBuilder.Builder({
  tasks: ['linux-x64'],
  mute: false
}, ".");

// Build returns a promise
builder.build().then(function () {
  const buildDir = '../build'
  const distDir = buildDir + '/dist';
  const appName = 'InsteadMan';
  const linux = 'linux';
  const x64 = 'x64';

  console.log('GNU/Linux changes...');
  const gnulinInsteadManPathes = {
    '64': distDir + '/' + appName + '-' + linux + '-' + x64 + '/'
  };
  const gnulinBuildPath = buildDir + '/' + linux + '/';

  for (let platform in gnulinInsteadManPathes) {
    fs.renameSync(gnulinInsteadManPathes[platform] + appName, gnulinInsteadManPathes[platform] + appName.toLowerCase());
    fs.copySync(gnulinBuildPath + 'icon.png', gnulinInsteadManPathes[platform] + 'icon.png');
    fs.copySync(gnulinBuildPath + 'createdesktopfile', gnulinInsteadManPathes[platform] + 'createdesktopfile');
    fs.copySync(gnulinBuildPath + 'README', gnulinInsteadManPathes[platform] + 'README');
  }
  console.log('GNU/Linux changes done.');

  console.log('All done!');
}).catch(function (error) {
  console.error(error);
});
