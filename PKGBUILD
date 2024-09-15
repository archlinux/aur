# ttf-giftscop
# Maintainer: Sterophonick

pkgname=ttf-giftscop
pkgver=13.3_1.0_1.1.1
pkgrel=1
arch=('any')
pkgdesc="Recreations of three fonts from Petscop, used in Giftscop"
source=(https://giftscop.com/fnt/PetscopWide.ttf
        https://giftscop.com/fnt/PetscopTall.ttf
        https://giftscop.com/fnt/PanicTF.ttf)
md5sums=('c8656e3995c428d26e223cb217ff4f72'
         '7fcdbebf44a6d521d92ecacba3787070'
         '0410f25b7c3f80002a9a315e16f09325')

package() {
	mkdir "${pkgdir}/usr"
    mkdir "${pkgdir}/usr/share"
    mkdir "${pkgdir}/usr/share/fonts"
    cp * "${pkgdir}/usr/share/fonts"
}

