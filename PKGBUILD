# Maintainer: Caio Novais <caionov08 at gmail dot com>
pkgname=ungoogled-chromium-bin
_pkgname=chromium
_pkgname2=ungoogled-chromium
pkgver=80.0.3987.149
pkgrel=1
pkgdesc="A lightweight approach to removing Google web service dependency"
arch=('x86_64')
url="https://ungoogled-software.github.io/ungoogled-chromium-binaries/releases/archlinux/"
license=('BSD')
conflicts=("$_pkgname" "$_pkgname2")
provides=("$_pkgname")
source=("$_pkgname2-$pkgver.pkg.tar.xz::https://github.com/Chexier/ungoogled-chromium-binaries/releases/download/80.0.3987.149-1/ungoogled-chromium-80.0.3987.149-1-x86_64.pkg.tar.xz")
md5sums=('b27f0d3163f8b8db1549f7c87673cfa3')

package() {
   install -d "$srcdir/usr" "$pkgdir/usr"
}
