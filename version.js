const request = require("request");

request("https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance", function (error, response, body) {
    let content = String(body);
    let str = content.match(/\"Version\":\"20.*?\"/g)[0]
        .replace(/^.*\":\"/, "")
        .replace(/\"$/, "");
    console.log(str);
})
