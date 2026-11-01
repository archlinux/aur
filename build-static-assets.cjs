// SPDX-License-Identifier: 0BSD
// Rebuild the same Bootstrap and jQuery releases from their readable sources.
const fs = require('fs');
const path = require('path');
const cp = require('child_process');
const {createRequire} = require('module');
const [tools, bootstrap, jquery, sizzle, output] = process.argv.slice(2).map(p => path.resolve(p));
const requireTool = createRequire(path.join(tools, 'package.json'));
const read = p => fs.readFileSync(p, 'utf8');
(async () => {
  for (const name of ['css', 'js', 'fonts']) fs.mkdirSync(path.join(output, name), {recursive:true});
  // Match upstream's strictMath and browser support configuration.
  const bridge = JSON.parse(read(path.join(bootstrap, 'grunt/configBridge.json')));
  const css = await requireTool('less').render(read(path.join(bootstrap, 'less/bootstrap.less')),
    {filename:path.join(bootstrap, 'less/bootstrap.less'), math:'parens'});
  const prefixed = await requireTool('postcss')([
    requireTool('autoprefixer')({overrideBrowserslist:bridge.config.autoprefixerBrowsers})
  ]).process(css.css, {from:undefined});
  const minimized = new (requireTool('clean-css'))({compatibility:'ie8', level:1,
    specialComments:'all'}).minify(prefixed.css);
  if (minimized.errors.length) throw Error(minimized.errors.join('\n'));
  fs.writeFileSync(path.join(output, 'css/bootstrap.min.css'), minimized.styles + '\n');
  const plugins = ['transition','alert','button','carousel','collapse','dropdown','modal',
    'tooltip','popover','scrollspy','tab','affix'];
  const bootstrapJS = [...bridge.config.jqueryCheck, ...bridge.config.jqueryVersionCheck,
    ...plugins.map(name => read(path.join(bootstrap, 'js', name + '.js')))].join('\n');
  const intermediate = path.join(bootstrap, 'bootstrap-from-source.js');
  fs.writeFileSync(intermediate, bootstrapJS);
  cp.execFileSync('uglifyjs', [intermediate, '--compress', '--mangle', '--comments', '/^!/',
    '--output', path.join(output, 'js/bootstrap.min.js')], {stdio:'inherit'});
  // Sizzle is authored in one readable file. Upstream's build substitutes these tokens.
  const selector = read(path.join(sizzle, 'src/sizzle.js')).replace(/@VERSION/g, '2.3.3')
    .replace(/@DATE/g, new Date(Number(process.env.SOURCE_DATE_EPOCH || 0) * 1000).toISOString());
  fs.mkdirSync(path.join(jquery, 'external/sizzle/dist'), {recursive:true});
  fs.writeFileSync(path.join(jquery, 'external/sizzle/dist/sizzle.js'), selector);
  const modules = path.join(tools, 'node_modules');
  const link = path.join(jquery, 'node_modules');
  const existing = fs.lstatSync(link, {throwIfNoEntry:false});
  if (existing) {
    if (!existing.isSymbolicLink() || fs.realpathSync(link) !== fs.realpathSync(modules))
      throw Error('Unexpected existing jQuery node_modules path');
  } else fs.symlinkSync(modules, link, 'dir');
  // Use upstream's complete AMD-module assembly task. No custom/slim modules are excluded.
  const gruntfile = path.join(jquery, 'source-build.cjs');
  fs.writeFileSync(gruntfile, `module.exports = grunt => {
    grunt.initConfig({pkg:grunt.file.readJSON('package.json'),
      build:{all:{dest:'dist/jquery.js',minimum:['core','selector'],removeWith:{}}}});
    require('./build/tasks/build.js')(grunt);
  };\n`);
  cp.execFileSync(process.execPath, [path.join(tools, 'node_modules/grunt/bin/grunt'),
    '--gruntfile', gruntfile, 'build:*:*'], {cwd:jquery, stdio:'inherit'});
  cp.execFileSync('uglifyjs', [path.join(jquery, 'dist/jquery.js'), '--compress', '--mangle',
    '--comments', '/^!/', '--output', path.join(output, 'js/jquery-3.2.0.min.js')], {stdio:'inherit'});
  for (const name of fs.readdirSync(path.join(bootstrap, 'fonts')))
    fs.copyFileSync(path.join(bootstrap, 'fonts', name), path.join(output, 'fonts', name));
  console.log('PASS: rebuilt Bootstrap 3.3.7 LESS and JavaScript, jQuery 3.2.0 modules and Sizzle 2.3.3 source');
})().catch(error => {console.error(error); process.exitCode=1;});
