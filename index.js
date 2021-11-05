const request = require('request');
request(`https://dev.azure.com/xamarin/public/_apis/build/builds/${process.argv.slice(2)[0]}/artifacts`, async function (error, response, body) {
    const data = JSON.parse(body);
    console.log(data.value.find(x => x.name == "installers-unsigned - Linux").resource.downloadUrl);
});
