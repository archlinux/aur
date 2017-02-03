# Maintainer: widowild
# Contributors: Danny Su <contact@dannysu.com>

pkgname=keepass-plugin-http-git
pkgver=r172.ee08d76
pkgrel=2
pkgdesc="KeePass plugin to expose password entries securely (256bit AES/CBC) over HTTP"
license=('GPL3')
depends=('keepass')
conflicts=('keepasshttp' 'keepass-plugin-http')
arch=('any')
url="http://github.com/pfn/keepasshttp"
source=(https://github.com/pfn/keepasshttp/raw/master/KeePassHttp.plgx)
sha256sums=('430948219b0bc282fbf0760da7b66f72b13eee4db57de457e563342d253bd8ae')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    install -m644 KeePassHttp.plgx "${pkgdir}"/usr/share/keepass/plugins/
}
