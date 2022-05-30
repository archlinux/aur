# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=tetragon
pkgname=$_pkgname-bin
pkgver=0.0.0
pkgrel=0
pkgdesc="eBPF-based Security Observability and Runtime Enforcement"
url="https://github.com/cilium/$_pkgname"
license=('APACHE')
arch=('x86_64')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/tetragon-cli/${_pkgname}-linux-amd64.tar.gz")
sha512sums=('fccb0f54b228265f480b29b60ac7531bda7a5279004b3ac9cd3d4f2c6094eb7c95db4b7147c87f04a3146b8ceaa92e8fe4b8119d3c65e194181bc78947dc5f04')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  tar -xz -C $srcdir -f $_pkgname-$pkgver.tar.gz
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
}

#vim: syntax=sh

