# Maintainer: Guru <anjanaya@gmail.com>
pkgname=data-peek-bin
pkgver=0.39.1
pkgrel=1
pkgdesc="A minimal, fast SQL client desktop application for developers"
arch=('x86_64')
url="https://www.datapeek.dev"
license=('MIT')
provides=('data-peek')
conflicts=('data-peek')
depends=('hicolor-icon-theme')
source=("https://github.com/Rohithgilla12/data-peek/releases/download/v${pkgver}/data-peek-${pkgver}-amd64.deb")
sha256sums=('ee40f04e293c4590d0e1b8541184ae7e26b743f568c9f9c12c61dd495e1e2215')
options=('!strip')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
