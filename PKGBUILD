# Maintainer: Guru <anjanaya@gmail.com>
pkgname=data-peek-bin
pkgver=0.20.1
pkgrel=1
pkgdesc="A minimal, fast SQL client desktop application for developers"
arch=('x86_64')
url="https://www.datapeek.dev"
license=('MIT')
provides=('data-peek')
conflicts=('data-peek')
depends=('hicolor-icon-theme')
source=("https://github.com/Rohithgilla12/data-peek/releases/download/v${pkgver}/data-peek-${pkgver}-amd64.deb")
sha256sums=('c9e80107f87947add99a1254e2a609c7eb1e58f9332ebe64308bfe72494ef47f')
options=('!strip')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
