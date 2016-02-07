# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Anthony HAMON <hamon.anth@gmail.com>
pkgname=goller
pkgver=2.3.0
pkgrel=1
pkgdesc="Command line log parser to aggregate fields and count occurences"
arch=('x86_64' 'i686')
url="https://github.com/antham/goller"
license=('GPL')
source=("https://github.com/antham/goller/releases/download/v2.3.0/goller_linux_386")
md5sums=("0b159f72bbb51c68e9cbe7ca0b103592")

package() {
    install -Dm755 "goller_linux_386" "$pkgdir/usr/bin/$pkgname"
}
