if (process.type === 'renderer') {
  if (typeof module !== 'undefined') {
    const nodeModules = `${__dirname}/resources/app.asar/node_modules`;
    module.paths.unshift(nodeModules);
    global.module.paths.unshift(nodeModules);
  }
} else {
  const { app, session } = require('electron');
  const appPath = `${__dirname}/resources/app.asar`;
  const metadata = require(`${appPath}/package.json`);
  const getPath = app.getPath.bind(app);

  app.setAppPath(appPath);
  app.setName(metadata.name);
  app.getVersion = () => metadata.version;
  app.getPath = name => name === 'exe' ? __filename : getPath(name);
  process.resourcesPath = `${__dirname}/resources`;
  app.whenReady().then(() => {
    session.defaultSession.setPreloads([
      ...session.defaultSession.getPreloads(),
      __filename,
    ]);
  });
  require(appPath);
}
