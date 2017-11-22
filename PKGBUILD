# Maintainer: Reik Keutterling <spielkind@gmail.com>
pkgname=notary-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Notary is a project that allows anyone to have trust over arbitrary collections of data."
arch=('x86_64')
url="https://github.com/theupdateframework/notary"
license=('APACHE')
source=("https://github.com/theupdateframework/notary/releases/download/v${pkgver}/notary-Linux-amd64")
sha256sums=("06cd02c4c2e7a3b1ad9899b03b3d4dde5392d964c675247d32f604a24661f839")


package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 $srcdir/notary-Linux-amd64 $pkgdir/usr/bin/notary
}
