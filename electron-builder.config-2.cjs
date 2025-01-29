
module.exports = () => {
  const config = require('./electron-builder.config.cjs')();
  delete config.mac;
  delete config.win;
  delete config.nsis;
  delete config.linux;
  return config;
};
