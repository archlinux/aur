# Maintainer: Anes Belfodil <ans.belfodil@gmail.com>
pkgname=randwall-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Randomly changes desktop wallpaper'
arch=('x86_64')
url='https://github.com/arch-anes/randwall'
license=('MIT')
depends=()
source=("randwall.tar.xz::https://github.com/arch-anes/randwall/releases/download/v$pkgver/randwall_standalone_linux-x64.tar.gz")
sha256sums=('SKIP')

package() {
  cd ${srcdir}

  install -d $pkgdir/usr/bin
  install -Dm755 randwall $pkgdir/usr/bin
}
