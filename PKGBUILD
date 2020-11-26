# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=pinniped
pkgname=$_pkgname-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Pinniped provides identity services for Kubernetes clusters"
url="https://github.com/vmware-tanzu/$_pkgname"
license=('APACHE')
source=("$_pkgname::$url/releases/download/v$pkgver/$_pkgname-cli-linux-amd64")
arch=('x86_64')
sha512sums=('1d940739bdab3b01bab32c8b5982891003b1e78e5de0eb1906d51cd61a41bb5d72925871cf6161fd4f0130d61e8cbab0067dc9a7e1aead0a4cc44e2997a8f324')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
}

#vim: syntax=sh
