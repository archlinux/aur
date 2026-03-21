# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kubectl-ai
pkgname=$_pkgname-bin
pkgver=0.0.30 # renovate: datasource=github-releases depName=GoogleCloudPlatform/kubectl-ai
pkgrel=1
pkgdesc="AI powered Kubernetes Assistant"
url="https://github.com/GoogleCloudPlatform/$_pkgname"
license=('Apache-2.0')
source=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_Linux_x86_64.tar.gz"
)
arch=('x86_64')
sha512sums=('a0b953f3df7b25df1aad8875f746c5e1935ff506c6e667222e6617b69e037e7235782624109a3f7923609b5179f84515717bc2d280917a50162219f78c6db52f')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
