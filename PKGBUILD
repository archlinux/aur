# Maintainer: Reik Keutterling <spielkind@gmail.com>
pkgname=notary-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Notary is a project that allows anyone to have trust over arbitrary collections of data."
arch=('x86_64')
url="https://github.com/theupdateframework/notary"
license=('APACHE')
source=("https://github.com/theupdateframework/notary/releases/download/v${pkgver}/notary-Linux-amd64")
sha256sums=('73353b2b4b85604c738a6800465133cb3a828dff0aa26f3c0926dd9a73e19879')


package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 $srcdir/notary-Linux-amd64 $pkgdir/usr/bin/notary
}
