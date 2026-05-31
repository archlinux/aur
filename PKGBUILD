# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=otf-regaliamonarchartnouveau-font
pkgver=1.0
pkgrel=1
pkgdesc="Cool art nouveau serif font, free for Personal Use Only (freeware)"
arch=(any)
url="https://www.fontspace.com/regalia-monarch-art-nouveau-font-f160611"
license=('custom')
source=("https://get.fontspace.co/download/family/8ldez/fbc490fdc3a44d579245bfa19925cf37/regalia-monarch-art-nouveau-font.zip")
sha512sums=('03d96e3cb4041d09dd1c8bb9429c6269e25fb6b3bc65cfb7f86310555198d08aa397698e44c7543b95b2d7243edca46be37b4905b0147c5920999c8e2bcd5010')

package() {
    cd $srcdir
    #install -dm 755		${pkgdir}/usr/share/fonts/TTF/
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" ${srcdir}/*.otf
    install -D -m644 	${srcdir}/info.txt ${pkgdir}/usr/share/licenses/${pkgname}/RegaliaMonarchArtNouveau_Terms-Of-Use.txt
}
