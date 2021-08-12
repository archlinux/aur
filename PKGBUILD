# Maintainer: Piyush Pangtey <gokuvsvegita at gmail dot com>
_pkgname=gitin
pkgname="${_pkgname}-bin"
pkgver=0.2.5
pkgrel=1
pkgdesc="commit/branch/workdir explorer for git"
arch=('x86_64')
url="https://github.com/isacikgoz/gitin"
license=('BSD')
conflicts=("$_pkgname")
source=(
        "https://github.com/isacikgoz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_amd64.tar.gz"
        "https://raw.githubusercontent.com/isacikgoz/${_pkgname}/v${pkgver}/LICENSE"
       )
sha256sums=(
        'e768667eee5e51d8a30e53b45d4fa56f87109251b7afed15da326c91200ca417'
        'SKIP'
        )

package() {
    install -m755 -D gitin "$pkgdir"/usr/bin/gitin
    install -m644 -D LICENSE "$pkgdir/usr/share/doc/$_pkgname/LICENSE"
}
