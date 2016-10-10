# Maintainer: renek <aur@spaceshore.net>
_cranname=Rttf2pt1
pkgname=r-cran-rttf2pt1
pkgver=1.3.4
pkgrel=1
pkgdesc="R package containing ttf2pt1 for use with the extrafont package"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('any')
license=('custom')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
sha512sums=('04e49a17337e6393bddc2e478a076a5e743091207606106fea81f1ba9ba7904fd8ac63eca6f4c95aed8e77345ab8562b2778e7669e18e2d361508e82801abeb8')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
