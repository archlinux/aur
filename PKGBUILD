# Maintainer: Moritz Johner <beller.moritz@googlemail.com>
pkgname=glitchlock
pkgver=0.31
pkgrel=1
pkgdesc="a glitch art lockscreen for linux"
arch=('x86_64')
url="https://github.com/moolen/glitchlock"
license=('APACHE')
groups=()
depends=(glibc pam libx11)
makedepends=('go>=1.8')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/moolen/${pkgname}/archive/${pkgver}.tar.gz")
noextract=()
md5sums=('c1e1ab42913024cc543802d3261fe386')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  install -Dm0755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

