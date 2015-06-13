# Maintainer: Sander Zuidema <archlinux at grunny dot demon dot nl>

pkgname=glass
pkgver=0.4
pkgrel=1
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
 https://bitbucket.org/grauw/glass/downloads/glass-$pkgver.jar
 $pkgname
)
noextract=(glass-$pkgver.jar)
md5sums=('7b1e56de3ec590a6a021b127a21bae55'
         '3fa2766909bdc108dfdfdeac01f6bb04')

package() {
  # copy files
  cd "$srcdir"
  mkdir -p "$pkgdir/opt/glass"
  mkdir -p "$pkgdir/usr/bin"
  install -m755 glass-$pkgver.jar "$pkgdir/opt/glass/glass.jar"
  install -m755 $pkgname "$pkgdir/usr/bin/glass"  
}
