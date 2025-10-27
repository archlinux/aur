# Maintainer Per Osbäck <per@osbeck.com>

_pkgname=globalping
pkgname=$_pkgname-bin
pkgver=1.5.1 # renovate: datasource=github-releases depName=jsdelivr/globalping-cli
pkgrel=1
pkgdesc="Better understand your network routing, fix anycast issues, monitor your CDN and DNS performance, do uptime monitoring and build your own network tools for personal or public use."
url="https://github.com/jsdelivr/globalping-cli"
license=('MPL-2.0')
source=(
  "$_pkgname-$pkgver.pkg.tar.zst::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.pkg.tar.zst"
)
arch=('x86_64')
sha512sums=('10d2370af9deb0ebf4e42d28cecee89e11f8f442644e7da9382c7c40cd6c3f7354fa6fbf6978d29aae095b02ecf82bdaeea16d2d50f31c8528e9be60eafa3e3a')
conflicts=("$_pkgname" "${_pkgname}-cli")

package() {
  install -D -m 0755 "$srcdir/usr/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
