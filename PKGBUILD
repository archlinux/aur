# Maintainer: Alexander Jesner <alexander at jesner dot eu>

pkgname=nuget3
pkgver=3.3
pkgrel=1
pkgdesc="Package manager for .NET."
arch=('any')
url="http://www.nuget.org"
license=('APACHE')
depends=('mono' 'sh')
conflicts=('nuget')
source=(https://dist.nuget.org/win-x86-commandline/v${pkgver}.0/nuget.exe
				'nuget')
install="${pkgname}.install"
md5sums=('1e0f14fdbc11c22280ed1bebc610fbf0'
         'd78ac3ef24bebbf942d63ad3b1e205fe')

package() {
install -d ${pkgdir}/usr/lib/nuget
install -d ${pkgdir}/usr/bin

install -m 0644 ${srcdir}/nuget.exe ${pkgdir}/usr/lib/nuget/
install -m 0755 ${srcdir}/nuget ${pkgdir}/usr/bin/nuget
}

