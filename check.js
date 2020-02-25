#!/usr/bin/env node

const fs = require("fs");

let configFile = JSON.parse(fs.readFileSync("local.json", {
    encoding: "utf8"
}));

if (configFile.discord["client_id"] === "INSERT_CLIENT_ID_HERE" ||
    configFile.discord["client_secret"] === "INSERT_CLIENT_SECRET_HERE" ||
    configFile.discord["redirect_uri"] === "INSERT_REDIRECT_URI_HERE") {
    
    console.log("  -> Modify the local.json file to include your own parameters, and then run makepkg again.");
    process.exit(1);
}
