# Maintainer: Guru <anjanaya@gmail.com>
pkgname=data-peek-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="A minimal, fast SQL client desktop application for developers"
arch=('x86_64')
url="https://www.datapeek.dev"
license=('MIT')
provides=('data-peek')
conflicts=('data-peek')
depends=('hicolor-icon-theme')
source=("https://github.com/Rohithgilla12/data-peek/releases/download/v${pkgver}/data-peek-${pkgver}-amd64.deb")
sha256sums=('bc68bfe655b853958e480bbdf7e99b6e2a20d9d66dbc669a3a7340565c837f1e')
options=('!strip')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
