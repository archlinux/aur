# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kubectl-ai
pkgname=$_pkgname-bin
pkgver=0.0.27 # renovate: datasource=github-releases depName=GoogleCloudPlatform/kubectl-ai
pkgrel=1
pkgdesc="AI powered Kubernetes Assistant"
url="https://github.com/GoogleCloudPlatform/$_pkgname"
license=('Apache-2.0')
source=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_Linux_x86_64.tar.gz"
)
arch=('x86_64')
sha512sums=('c4f3eb2ac45358a3c8c10675cbcf096d81c39291cb2515defde774be836855888fe81e1484d2eb45f21d4b3427bd9178cc0a24c0081cf76f2ce48daa991703a8')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
