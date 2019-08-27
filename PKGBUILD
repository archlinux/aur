# Maintainer: Piyush Pangtey <gokuvsvegita at gmail dot com>
_pkgname=gitin
pkgname="${_pkgname}-bin"
pkgver=0.2.1
pkgrel=1
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
        'a11cddbcc20a91c1e29e902f3152158bd2f6d60069d220a7adac7fff5fb1be7f'
        'SKIP'
        )

package() {
    install -m755 -D gitin "$pkgdir"/usr/bin/gitin
    install -m644 -D LICENSE "$pkgdir/usr/share/doc/$_pkgname/LICENSE"
}
