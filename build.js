var nativefier = require('nativefier').default;

// possible options, defaults unless specified otherwise
var options = {
    name: 'Google Colab', // will be inferred if not specified
    targetUrl: 'https://colab.research.google.com', // required
    platform: 'linux',
    //arch: 'x64',
    electronVersion: 'SYS_ELECTRON_VERS',
    out: '.',
    asar: true, // see conceal
    icon: 'googlecolab.png',
    showMenuBar: false,
    width: 1280,
    height: 800,
    ignoreCertificate: false,
    ignoreGpuBlacklist: false,
    enableEs3Apis: true,
    internalUrls: '.*?\.google\.*?',
    blockExternalUrls: false,
    insecure: false,
    userAgent: 'firefox',
    honest: false,
    zoom: 1.0,
    singleInstance: false,
    clearCache: false,
    fileDownloadOptions: {
        saveAs: true, // always show "Save As" dialog
    },
};

nativefier(options, function (error, appPath) {
    if (error) {
        console.error(error);
        throw `Nativefier failed with error ${error}`;
    }
    console.log('App has been successfully nativefied');
});
