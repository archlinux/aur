# Maintainer: Aleks Grabowski <hurufu+aur@gmail.com>

pkgname=prologs
pkgver=0.1
pkgrel=1
pkgdesc='Test your Prolog program against different engines'
arch=(x86_64 i686)
depends=(make remake)
optdepends=(
    'swi-prolog: Comprehensive free Prolog environment'
    'ciao-lang: Modern Prolog implementation'
    'gprolog: Free Prolog compiler'
    'scryer-prolog: Free ISO Prolog system'
    'trealla: A compact, efficient Prolog interpreter'
)

package() {
    cd "$srcdir/all-prologs"
    install -d --mode=644 rules.mk "$pkgdir/usr/share/$pkgname/rules.mk"
    install -d --mode=755 prologs "$pkgdir/usr/bin/$pkgname"
}
