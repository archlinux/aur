# Maintainer: parov0z <andrey.android7890@gmail.com>

pkgname=bootsplash-manager-bin
pkgver=1.10
pkgrel=1
pkgdesc="Simple bootsplash manager"
url="https://github.com/parov0z/bootsplash-manager"
arch=(x86_64)
license=(GPL3)
depends=('qt5-base'
         'bootsplash-systemd'
         'kauth'
         'pamac'
         'sdl2')
conflicts=('bootsplash-manager')

source=("https://github.com/parov0z/bootsplash-manager/releases/download/$pkgver/bootsplash-manager-$pkgver.tar.gz")

md5sums=('4d8b4d47b4fb0da7d72ecbe9c5689988')

package() {
     bsdtar -xf "$srcdir/bootsplash-manager-$pkgver.tar.gz" -C "$pkgdir"
}
