# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kube-hunter
pkgname=$_pkgname-bin
pkgver=0.6.8 # renovate: datasource=github-releases depName=aquasecurity/kube-hunter
pkgrel=2
pkgdesc="Hunt for security weaknesses in Kubernetes clusters"
url="https://github.com/aquasecurity/$_pkgname"
license=('Apache-2.0')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/${_pkgname}-linux-x86_64-refs.tags.v$pkgver")
arch=('x86_64')
sha512sums=('04fdedda9656f77d436f907ff983573074499a39e73aa27541b89c9d2f81e0d6cbf2f0804b77a57f97af855d3375fd898afe28d273267c6f20420e773ff01318')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname-$pkgver $pkgdir/usr/bin/$_pkgname
}

#vim: syntax=sh
