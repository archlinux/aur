// Yes, I'm that lazy.

const fs = require("fs");
fs.writeFileSync("PKGBUILD", fs.readFileSync("PKGBUILD").toString().replace(
    /pkgver=.+/g,
    "pkgver=" + process.argv[process.argv.length - 1]
));

require("child_process").execSync("makepkg --printsrcinfo > .SRCINFO");
require("child_process").execSync("updpkgsums");