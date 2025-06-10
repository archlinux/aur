# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kubectl-ai
pkgname=$_pkgname-bin
pkgver=0.0.12 # renovate: datasource=github-releases depName=GoogleCloudPlatform/kubectl-ai
pkgrel=1
pkgdesc="AI powered Kubernetes Assistant"
url="https://github.com/GoogleCloudPlatform/$_pkgname"
license=('APACHE')
source=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_Linux_x86_64.tar.gz"
)
arch=('x86_64')
sha512sums=('f9964240ea5ca90bb09566e63fd74ef2e36d8d137527def75710fc0bc2b29b2d6bf9d0fb73174ef5de6e0302c095a3b09c19306aab7d6452fe7994e59b48f867')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
