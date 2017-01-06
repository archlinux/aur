# Maintainer: Alexander Jesner <alexander at jesner dot eu>

pkgname=nuget3
pkgver=3.5.0
pkgrel=2
pkgdesc="Package manager for .NET."
arch=('any')
url="http://www.nuget.org"
license=('APACHE')
depends=('mono' 'sh')
conflicts=('nuget')
source=(https://dist.nuget.org/win-x86-commandline/v${pkgver}/NuGet.exe
				'nuget')
install="${pkgname}.install"
md5sums=('406324e1744923a530a3f45b8e4fe1eb'
         'd78ac3ef24bebbf942d63ad3b1e205fe')

package() {
install -d ${pkgdir}/usr/lib/nuget
install -d ${pkgdir}/usr/bin

install -m 0644 ${srcdir}/NuGet.exe ${pkgdir}/usr/lib/nuget/nuget.exe
install -m 0755 ${srcdir}/nuget ${pkgdir}/usr/bin/nuget
}

