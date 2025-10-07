# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kubectl-ai
pkgname=$_pkgname-bin
pkgver=0.0.26 # renovate: datasource=github-releases depName=GoogleCloudPlatform/kubectl-ai
pkgrel=1
pkgdesc="AI powered Kubernetes Assistant"
url="https://github.com/GoogleCloudPlatform/$_pkgname"
license=('Apache-2.0')
source=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_Linux_x86_64.tar.gz"
)
arch=('x86_64')
sha512sums=('203686485d7971ef6350e21610632159a35e3f66fa9d2bb72e11ddbbf211ed3c17a27eb9e973015fccefa3527ef90bffcd23dc3c93e9a27fd973f14f3a3fab47')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
