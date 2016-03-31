# Maintainer: Sander Zuidema <s.zuidema at bazix dot nl>

pkgname=glass
pkgver=0.4
pkgrel=2
pkgdesc="A cross-platform assembler for the Z80 processor"
arch=('any')
url="https://bitbucket.org/grauw/glass"
license=('Apache')
groups=()
depends=('java-runtime')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
 https://bitbucket.org/grauw/$pkgname/downloads/$pkgname-$pkgver.jar
 $pkgname
)
noextract=($pkgname-$pkgver.jar)

package() {
  mkdir -p "$pkgdir/usr/share/java/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  install -m755 $pkgname-$pkgver.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -m755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
sha256sums=('6f270760f650b2d02f184678356aa50b776f47ea7715ff0794efbbbef7a7d47b'
            '96378d1179a06aec3f405e833cb79df158c8ccad6afaa67ed34e9a9473744841')
