# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kubectl-ai
pkgname=$_pkgname-bin
pkgver=0.0.14 # renovate: datasource=github-releases depName=GoogleCloudPlatform/kubectl-ai
pkgrel=1
pkgdesc="AI powered Kubernetes Assistant"
url="https://github.com/GoogleCloudPlatform/$_pkgname"
license=('APACHE')
source=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_Linux_x86_64.tar.gz"
)
arch=('x86_64')
sha512sums=('9d2ac87a556eabb2b9577506c5266ea47446d75b49bcbff4a295682f5b6af0da560312dfd7cf2f18225b585b11184bdb5fd1c347ce86a8915011147173e1b761')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
