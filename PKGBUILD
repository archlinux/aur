#Maintainer: Plague-doctor <plague <at>> privacyrequired <<dot>> com >

pkgname=spw
pkgver=1.7
pkgrel=2
pkgcommit="dedf1a1e059dd8bbb04ea5b076ecd1d83560e1f8"
pkgdesc="spw - secure password generator"
arch=('any')
url="https://gitlab.com/Plague_Doctor/spw"
license=('GPL')
depends=('python')
source=("spw-$pkgver-$pkgrel.tar.bz2"::"https://gitlab.com/Plague_Doctor/spw/-/archive/${pkgver}/spw-${pkgver}.tar.bz2")
sha256sums=('4652f97ad9f979ed896e33307044906bb73f437931d417974ee93ea64fd3a174')

validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

package() {
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/man/man1/"
    install -d "$pkgdir/usr/share/dict/"
    install "$srcdir/$pkgname-$pkgver/spw.py" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "$srcdir/$pkgname-$pkgver/dict/spw_en" "${pkgdir}/usr/share/dict/spw_en"
    install -Dm644 "$srcdir/$pkgname-$pkgver/man/spw.1" "${pkgdir}/usr/share/man/man1/"
}
