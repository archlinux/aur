# Maintainer: Kye Hunter <kye(dot)evan(dot)hunter(at)gmail(dot)com>

pkgname=capcom-git
_pkgname=${pkgname%%-git}
pkgver=0.1
pkgrel=1
pkgdesc="Atom feed aggregator for Gemini"
arch=(any)
url="https://git.sr.ht/~solderpunk/capcom"
license=('GPLv3')
depends=(
    'python-agunua'
    'python-feedparser'
    'python-urllib3'
)
makedepends=()
provides=(
    $_pkgname
)
conflicts=(
    $_pkgname
)
source=('git+https://git.sr.ht/~solderpunk/capcom')
sha256sums=('SKIP')

package() {
    install -D -m0755 -t \
        "${pkgdir}"/usr/bin \
        "${srcdir}"/"${_pkgname}"/capcom.py
}

