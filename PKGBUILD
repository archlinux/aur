# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Anthony HAMON <hamon.anth@gmail.com>
pkgname=yogo
pkgver=2.7.0
pkgchecksum=c08b1290d069ab7b4dbfee1dc9686cb9
pkgrel=1
pkgdesc="Interact with yopmail from command-line"
arch=('x86_64')
url="https://github.com/antham/yogo"
license=('GPL')
source=("https://github.com/antham/yogo/releases/download/v$pkgver/yogo_linux_amd64")
md5sums=($pkgchecksum)

package() {
    install -Dm755 "yogo_linux_amd64" "$pkgdir/usr/bin/$pkgname"
}
