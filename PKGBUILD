# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=pinniped
pkgname=$_pkgname-bin
pkgver=0.6.0
pkgrel=0
pkgdesc="Pinniped provides identity services for Kubernetes clusters"
url="https://github.com/vmware-tanzu/$_pkgname"
license=('APACHE')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-cli-linux-amd64")
arch=('x86_64')
sha512sums=('09304449e8de7a8484b3728223b0eb4088977b659c34b2c65ce30ef75b884dd6e3d82f458227c9d29b970395b0f071e4aca6d37467212fb6cf66d2ce259764fd')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname-$pkgver $pkgdir/usr/bin/$_pkgname
}

#vim: syntax=sh
