# Maintainer jorge-barroso <jorge_barroso_11 at hotmail dot com>

pkgname=ttf-arial-rounded-mt
pkgver=1.51
pkgrel=1
pkgdesc='Arial Rounded MT font family'
arch=('any')
url='https://learn.microsoft.com/en-us/typography/font-list/arial-rounded-mt'
license=('custom')
depends=()
makedepends=()
conflicts=('macfonts')
source=("$pkgname::https://cdn1.maisfontes.com/temp/arial-rounded-mt-maisfontes.2624.zip"
        "$pkgname-bold::https://cdn1.maisfontes.com/temp/arial-rounded-mt-bold-maisfontes.8490.zip"
        "$pkgname-extrabold::https://cdn1.maisfontes.com/temp/arial-rounded-mt-extrabold-maisfontes.acf0.zip"
        "$pkgname-light::https://cdn1.maisfontes.com/temp/arial-rounded-mt-light-maisfontes.06ab.zip")
sha256sums=('f576b5cc965847ced5b246722887e2fd78b0f2debfb39a3be1bd9b0d7a9779cf'
            'bc185ef10a0fe8bd590cf2f342751a42ca92627bbbf64ea751be14fe9650c4a9'
            'cf8529e48f8cde23e50e12b356b2c23977389c73214a2b92d4a6ba7dee3d6e02'
            '7ea0270f62c7a03d7587e34b322884e8e3f90d0b8f7668904ac629438b86906d')
package() {
	cd $srcdir
	install -d "$pkgdir"/usr/share/fonts/TTF
	install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF
}
