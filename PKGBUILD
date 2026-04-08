# Maintainer: Guru <anjanaya@gmail.com>
pkgname=data-peek-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="A minimal, fast SQL client desktop application for developers"
arch=('x86_64')
url="https://www.datapeek.dev"
license=('MIT')
provides=('data-peek')
conflicts=('data-peek')
depends=('hicolor-icon-theme')
source=("https://github.com/Rohithgilla12/data-peek/releases/download/v${pkgver}/data-peek-${pkgver}-amd64.deb")
sha256sums=('ed1ac26780a7ac8fd9e1c731d8e2da93e1f3c693d58caab8f9decd78d0a984c9')
options=('!strip')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
