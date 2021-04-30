# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=konfig
pkgname=kubectl-$_pkgname
pkgver=0.2.5
pkgrel=0
pkgdesc="konfig helps to merge, split or import kubeconfig files"
url="https://github.com/corneliusweig/$_pkgname"
license=('APACHE')
arch=('x86_64')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('4d7bcf87970d62864a084d23640fd942eb08280e141e399f883f521da47ea06dad87a4cb357f69b9fe4fd3ba4d6152159cfefb3e273389530f98c6604cbbaa6a')

package() {
  install -D -m 0755 $srcdir/$_pkgname-$pkgver/$_pkgname $pkgdir/usr/bin/kubectl-$_pkgname
}

#vim: syntax=sh

