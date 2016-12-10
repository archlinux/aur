#Maintainer: Plague-doctor <plague <at>> privacyrequired <<dot>> com >

pkgname=spw
pkgver=1.0
pkgrel=1
pkgcommit="93445d6a7214b0bac5d782372b03ab8234aff5c7"
pkgdesc="spw - secure password generator"
arch=('any')
url="https://gitlab.com/Plague_Doctor/spw"
license=('GPL')
depends=('python')
source=("archive.tar.bz2"::"https://gitlab.com/Plague_Doctor/spw/repository/archive.tar.bz2?ref=$pkgver")
md5sums=('5303a94574d2a00c9b761e125d86eb54')

validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

package() {
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/man/man1/"
    install -d "$pkgdir/usr/share/dict/"
    install "$srcdir/$pkgname-$pkgver-$pkgcommit/spw.py" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgcommit/dict/spw_en" "${pkgdir}/usr/share/dict/spw_en"
    install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgcommit/man/spw.1" "${pkgdir}/usr/share/man/man1/"
}
