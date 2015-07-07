# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>
# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>

pkgname=keepass-plugin-http
pkgver=1.8.4.0
pkgrel=1
pkgdesc="KeePass plugin to expose password entries securely (256bit AES/CBC) over HTTP"
license=('unknown')
depends=('keepass')
provides=('keepasshttp')
conflicts=('keepasshttp')
arch=('any')
url="http://github.com/pfn/keepasshttp"
_commit="63fa55850fc4908527c453ff97765f5e945e389c"
source=(https://github.com/pfn/keepasshttp/raw/${_commit}/KeePassHttp.plgx)
sha256sums=('4803ea799962ec3e294691922d6255e63c5a96df36941f99ef633775829e7289')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    install -m644 KeePassHttp.plgx "${pkgdir}"/usr/share/keepass/plugins/
}
