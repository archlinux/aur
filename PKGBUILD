# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>
# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>

pkgname=keepass-plugin-http
pkgver=1.8.4.2
pkgrel=2
pkgdesc="KeePass plugin to expose password entries securely (256bit AES/CBC) over HTTP"
license=('unknown')
depends=('keepass')
provides=('keepasshttp')
conflicts=('keepasshttp')
arch=('any')
url="http://github.com/pfn/keepasshttp"
_commit="7728a1cfb5c2a235ec5caf43217d4d39a32a92d9"
source=(https://github.com/pfn/keepasshttp/raw/${_commit}/KeePassHttp.plgx)
md5sums=('323af5ade1d47d375cf65bc9a52ac45f')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    install -m644 KeePassHttp.plgx "${pkgdir}"/usr/share/keepass/plugins/
}
