# Maintainer: Hrle <5b0bae33-0d7b-4297-b3a5-f6294b4bfd39@anonaddy.me>
pkgname=dotnet-install
pkgver=v1
pkgrel=1
pkgdesc="Script used to install the .NET SDK and the shared runtime"
arch=('any')
url="https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script"
license=('MIT')
depends=('curl' 'bash')
source=('dotnet-install')
md5sums=('5a995842b520f8d35a17ce8c58103c9f')

package() {
  install -D -m0755 "$srcdir/dotnet-install" "$pkgdir/usr/bin/dotnet-install"
}
