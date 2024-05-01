# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
pkgname=simpleboot-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Dependency-free, all-in-one OS loader and bootable disk image creator."
arch=("x86_64")
url="https://gitlab.com/bztsrc/${pkgname%-bin}"
license=("MIT")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${url}/-/raw/main/distrib/${pkgname%-bin}_$pkgver-amd64.deb")
b2sums=("491b908a06e4180586aca08ec859289063ea41259edfbf90b5b3a78b5d6c61055134c3668c3561475564dc42fceabfbff24bae9cd33e541cf88c5239fac34ae6")

package() {
    bsdtar -xzf data.tar.gz -C $pkgdir
    find $pkgdir -type d -exec chmod 0755 {} \;
}
