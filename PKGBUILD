# Maintainer: ANDRoid7890 <andrey.android7890@gmail.com>

pkgname=bootsplash-manager-bin
pkgver=1.9
pkgrel=1
pkgdesc="Simple bootsplash manager"
url="https://github.com/ANDRoid7890/bootsplash-manager"
arch=(x86_64)
license=(GPL3)
depends=('qt5-base'
         'bootsplash-systemd'
         'kauth'
         'pamac'
         'sdl2')
conflicts=('bootsplash-manager')

source=("https://github.com/ANDRoid7890/bootsplash-manager/releases/download/$pkgver/bootsplash-manager-$pkgver.tar.gz")

md5sums=('f1ebc1e753ddbc94fc34a832e36b1e19')

package() {
     bsdtar -xf "$srcdir/bootsplash-manager-$pkgver.tar.gz" -C "$pkgdir"
}
