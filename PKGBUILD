# Maintainter: Ben Song <bensongsyz@gmail.com>
pkgname="pacman-archive"
pkgver=0.1.1
pkgrel=1
pkgdesc="This package will append proper archive url to mirrorlist"
arch=('x86_64')
license=('GPL')
source=(pacman-archive)
sha256sums=(e6ce7bc1412cec6f7f111c1080e01f4d9c16e9968fe16b4f49ffbac519334231)
package(){
    install -D --mode=755 --target-directory="${pkgdir}/usr/bin" "$srcdir"/pacman-archive
}
