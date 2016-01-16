# Maintainer: Danny Su <contact@dannysu.com>

pkgname=keepass-plugin-http-git
pkgver=r172.ee08d76
pkgrel=1
pkgdesc="KeePass plugin to expose password entries securely (256bit AES/CBC) over HTTP"
license=('GPL3')
depends=('keepass')
conflicts=('keepasshttp' 'keepass-plugin-http')
arch=('any')
url="http://github.com/pfn/keepasshttp"
source=(https://github.com/pfn/keepasshttp/raw/master/KeePassHttp.plgx)
sha256sums=('28ce9acd781d3f3e38e3b3b49ca7f4900ec6740f7effcbdccda5d334872c17b5')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    install -m644 KeePassHttp.plgx "${pkgdir}"/usr/share/keepass/plugins/
}
