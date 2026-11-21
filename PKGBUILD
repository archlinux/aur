# Maintainer Per Osbäck <per@osbeck.com>

_pkgname=globalping
pkgname=$_pkgname-bin
pkgver=1.7.0 # renovate: datasource=github-releases depName=jsdelivr/globalping-cli
pkgrel=1
pkgdesc="Better understand your network routing, fix anycast issues, monitor your CDN and DNS performance, do uptime monitoring and build your own network tools for personal or public use."
url="https://github.com/jsdelivr/globalping-cli"
license=('MPL-2.0')
source=(
  "$_pkgname-$pkgver.pkg.tar.zst::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.pkg.tar.zst"
)
arch=('x86_64')
sha512sums=('d408c0d9d88c47d4a84bb30a63f560abf78932b7c48a8c299d114592d34200ed9f88c7a621f633bbd3ae1d1eab9af5d474d493043fd4510b5228c9242502db86')
conflicts=("$_pkgname" "${_pkgname}-cli")

package() {
  install -D -m 0755 "$srcdir/usr/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
