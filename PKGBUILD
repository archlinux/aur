# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>
# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>

pkgname=keepass-plugin-http
pkgver=1.8.4.1
pkgrel=1
pkgdesc="KeePass plugin to expose password entries securely (256bit AES/CBC) over HTTP"
license=('unknown')
depends=('keepass')
provides=('keepasshttp')
conflicts=('keepasshttp')
arch=('any')
url="http://github.com/pfn/keepasshttp"
_commit="9cb207fec395ecc53881cd1dab98cb61d9315280"
source=(https://github.com/pfn/keepasshttp/raw/${_commit}/KeePassHttp.plgx)
md5sums=('78d2b692a2dc0014e4ec5a7aeadc13e5')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    install -m644 KeePassHttp.plgx "${pkgdir}"/usr/share/keepass/plugins/
}
