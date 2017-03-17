pkgname=armrr-git
pkgver=20141015
pkgrel=1
pkgdesc="Arch Linux script that downloads a pacman ranked mirrorlist."
arch=(any)
depends=(
	'grep'
	'sed'
	'curl')
source=(
	"https://raw.githubusercontent.com/Gen2ly/armrr/c544b3d01e673a26fd9b638161800040099589ab/armrr"
	"https://raw.githubusercontent.com/Gen2ly/armrr/c544b3d01e673a26fd9b638161800040099589ab/license.txt")
url="https://github.com/Gen2ly/armrr"
license=("GPL-2.0")
sha256sums=(
	'a6957c506d7a70dce0523d5fe2e3575b5b0dd2d3181de632109995fd337666c2'
	'8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')

package() {
  cd "$srcdir"
  install -Dm755 armrr "$pkgdir/usr/bin/armrr"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

