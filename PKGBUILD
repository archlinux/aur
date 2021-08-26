# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=pinniped
pkgname=$_pkgname-bin
pkgver=0.10.0
pkgrel=0
pkgdesc="Pinniped provides identity services for Kubernetes clusters"
url="https://github.com/vmware-tanzu/$_pkgname"
license=('APACHE')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-cli-linux-amd64")
arch=('x86_64')
sha512sums=('67f1ae06e238d54fdb2987575a5890c867d1c27990430e51f96d6d051ec8fba155a14a9d7d21d9e5e67134c534e9cdab4f231baca71ea937deb996f71b6fb9db')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname-$pkgver $pkgdir/usr/bin/$_pkgname
}

#vim: syntax=sh
