# Maintainer: Finn Petersen <fp7@posteo.net> 
pkgname=firefox-user-autoconfig
pkgver=1
pkgrel=1
pkgdesc="Make firefox use a source controllable autoconfig file in the user home"
url="https://support.mozilla.org/en-US/kb/customizing-firefox-using-autoconfig"
arch=("any")
license=("Unlicense")
optdepends=("firefox")
source=("autoconfig.js"
        "firefox.cfg")
backup=("usr/lib/firefox/defaults/pref/autoconfig.js"
        "usr/lib/firefox/firefox.cfg")
sha256sums=('e46fd52157485b8567d486142e708ebd653823c29d839485821c950fdf614d36'
            '232e722832647cab17e3be69cc817edb90dadfd4a64ddc58fe5b8bf7224a7cf8')

package() {
  cd "$srcdir";
  install -D -m 0644 autoconfig.js "$pkgdir/usr/lib/firefox/defaults/pref/autoconfig.js";
  install -D -m 0644 firefox.cfg "$pkgdir/usr/lib/firefox/firefox.cfg";
}
