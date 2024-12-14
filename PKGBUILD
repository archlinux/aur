# Maintainer: Aleks Grabowski <hurufu+aur@gmail.com>

pkgname=prologs
pkgver=0.1
pkgrel=3
pkgdesc='Test your Prolog program against different engines'
arch=(x86_64 i686)
url='https://github.com/hurufu/prolog-all'
depends=(make)
optdepends=(
    'remake: For time profiling'
    swi-prolog
    ciao-lang
    cs-prolog
    gprolog
    scryer-prolog
    trealla
    eclipse-clp
    bprolog
    binprolog
    poplog-git
    tuprolog-repl
    tau-prolog
    dogelog
    xsb-prolog
    yap
)
source=(git+https://github.com/hurufu/prolog-all.git)
sha256sums=(SKIP)

package() {
    cd "$srcdir/prolog-all"
    install -D --mode=644 rules.mk "$pkgdir/usr/share/$pkgname/rules.mk"
    install -D --mode=755 prologs "$pkgdir/usr/bin/$pkgname"
}
