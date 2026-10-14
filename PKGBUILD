# Maintainer: Guru <anjanaya@gmail.com>
pkgname=data-peek-bin
pkgver=0.34.0
pkgrel=1
pkgdesc="A minimal, fast SQL client desktop application for developers"
arch=('x86_64')
url="https://www.datapeek.dev"
license=('MIT')
provides=('data-peek')
conflicts=('data-peek')
depends=('hicolor-icon-theme')
source=("https://github.com/Rohithgilla12/data-peek/releases/download/v${pkgver}/data-peek-${pkgver}-amd64.deb")
sha256sums=('127b187f67e3392b04037dca96b5fa988c3549574c5df7447b6440cdd9fcf728')
options=('!strip')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
