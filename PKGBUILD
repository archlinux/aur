# Maintainer: desbma
pkgname=ttf-md-fonts-git
pkgver=1.0
pkgrel=0
pkgdesc='Material Design font icons'
arch=('any')
url='https://github.com/Templarian/MaterialDesign-Font'
license=('Pictogrammers Free License')
source=('MaterialDesignIconsDesktop.ttf::https://github.com/Templarian/MaterialDesign-Font/blob/master/MaterialDesignIconsDesktop.ttf')
sha512sums=('1c800056b0bb731537f3577f817fb50661482744d3cbceea812eda3423df2bd79a5334fb1814efc31d37b9e0e80613ee7f28b46d58600bab8086205d3da65913')

package() {
    install -Dm 644 -t "${pkgdir}/usr/share/fonts/TTF" MaterialDesignIconsDesktop.ttf
}
