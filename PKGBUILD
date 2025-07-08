# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=konfig
pkgname=kubectl-$_pkgname
pkgver=0.2.6 # renovate: datasource=github-releases depName=corneliusweig/konfig
pkgrel=2
pkgdesc="konfig helps to merge, split or import kubeconfig files"
url="https://github.com/corneliusweig/$_pkgname"
license=('Apache-2.0')
arch=('x86_64')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('29673d5f01a277986e7750367d2cb6189b2ed8f469c367fdf3ea7bf932812b9fe125751d3fd9735c3a6a37f1735af08ca694ce3402a27aa88e9ec97df6c3dc3e')

package() {
  install -D -m 0755 $srcdir/$_pkgname-$pkgver/$_pkgname $pkgdir/usr/bin/kubectl-$_pkgname
}

#vim: syntax=sh
