#Maintainer: Plague-doctor <plague <at>> privacyrequired <<dot>> com >

pkgname=spw
pkgver=1.5
pkgrel=1
pkgcommit="e7df1bc9b0d75ee499ba3d5968a1ca37dd6f1f90"
pkgdesc="spw - secure password generator"
arch=('any')
url="https://gitlab.com/Plague_Doctor/spw"
license=('GPL')
depends=('python')
source=("spw.tar.bz2"::"https://gitlab.com/Plague_Doctor/spw/repository/archive.tar.bz2?ref=$pkgver")
md5sums=('017af42d43eeb9fe5b6a6e7536539019')

validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

package() {
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/man/man1/"
    install -d "$pkgdir/usr/share/dict/"
    install "$srcdir/$pkgname-$pkgver-$pkgcommit/spw.py" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgcommit/dict/spw_en" "${pkgdir}/usr/share/dict/spw_en"
    install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgcommit/man/spw.1" "${pkgdir}/usr/share/man/man1/"
}
