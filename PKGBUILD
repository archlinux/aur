# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=pinniped
pkgname=$_pkgname-bin
pkgver=0.8.0
pkgrel=0
pkgdesc="Pinniped provides identity services for Kubernetes clusters"
url="https://github.com/vmware-tanzu/$_pkgname"
license=('APACHE')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-cli-linux-amd64")
arch=('x86_64')
sha512sums=('0d70903e5d53298e4f23bc567576ae2c0bfcc653b28de87e501aaa334a584e5c4a14be17d9ede22375cb0f76ceba2b94954cc27df29ebfceb59fda07281c25ca')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname-$pkgver $pkgdir/usr/bin/$_pkgname
}

#vim: syntax=sh
