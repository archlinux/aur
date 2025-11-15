# Maintainer: BlueGone <thomas.placais@protonmail.com>
pkgname=dotnet-install
pkgver=v1
pkgrel=2
pkgdesc="Script used to install the .NET SDK and the shared runtime"
arch=('any')
url="https://dot.net/${pkgver}/dotnet-install.sh"
license=('MIT')
depends=('curl' 'bash')
source=("dotnet-install::${url}")
md5sums=('d068b72ce751209caa65c809cdc2906d')

package() {
  install -D -m0755 "$srcdir/dotnet-install" "$pkgdir/usr/bin/dotnet-install"
}
