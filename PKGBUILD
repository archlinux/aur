# Maintainer: AstroFloyd  < AstroFloyd [at] gmail [dt] com >
pkgname=man-pages-fortran
pkgver=0.1.0
pkgrel=1
pkgdesc="Man pages for the Fortran language"
arch=('any')
url="https://github.com/AstroFloyd/man-pages-fortran"
license=('FDL-1.3')
changelog=ChangeLog
source=("https://github.com/AstroFloyd/man-pages-fortran/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('8da0bcb8f13de98e68c2ad5e7b4d2ad2246d962b07f2a69e0f60e12460f4b5a655a31ba3ff249368dc088b8758ab104771435688afeb53d9c11ea9fbda69c2e7')

package() {
    mkdir -p                            ${pkgdir}/usr/share/man/man3f/
    cp -vp ${pkgname}-${pkgver}/man3f/* ${pkgdir}/usr/share/man/man3f/
}
