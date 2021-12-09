# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="en_se"
pkgver=0.1
pkgrel=2
pkgdesc="English locale for Sweden with ISO date and time format"
url="https://gist.github.com/bmaupin/d64368e78cd359d309685fecbe2baf23"
license=("GPL")
arch=("any")
source=("https://gist.githubusercontent.com/bmaupin/d64368e78cd359d309685fecbe2baf23/raw/e933a0fc2e727aa640f4a1cb1f699622876940fc/en_SE")
sha256sums=('02b5cbfab303556238326730f31a1195915784479240bd2d2c97f9a4a10ec77b')
install="en_se.install"

package(){
 install -d -m 755 "$pkgdir/usr/share/i18n/locales/"
 install -D -m 644 "en_SE" "$pkgdir/usr/share/i18n/locales/"
}
