# Maintainer: Piyush Pangtey <gokuvsvegita at gmail dot com>
_pkgname=gitin
pkgname="${_pkgname}-bin"
pkgver=0.1.5
pkgrel=2
pkgdesc="commit/branch/workdir explorer for git"
arch=('x86_64')
url="https://github.com/isacikgoz/gitin"
license=('BSD')
conflicts=("$_pkgname")
source=(
        "https://github.com/isacikgoz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
        "https://raw.githubusercontent.com/isacikgoz/${_pkgname}/v${pkgver}/LICENSE"
       )
sha256sums=(
        '3b29e931972d4a104d41ccc49e74e62eb38f4c50c78cc8f660a702626ca372bc'
        'SKIP'
        )

package() {
    install -m755 -D gitin "$pkgdir"/usr/bin/gitin
    install -m644 -D LICENSE "$pkgdir/usr/share/doc/$_pkgname/LICENSE"
}
