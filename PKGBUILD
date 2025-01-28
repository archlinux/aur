# Maintainer: LS-Shandong <ls-shandong@outlook.com>
pkgname=emacs-htmlize
pkgver=1.58
pkgrel=1
pkgdesc="An Emacs Lisp library to Convert buffer text and decorations to HTML"
arch=('any')
url="https://github.com/hniksic/emacs-htmlize"
license=('GPL')
depends=('emacs')
source=(${url}/archive/refs/tags/release/$pkgver.tar.gz)
sha256sums=('2BAB035876A294656C72664050F021BC1A338194A0D58F02A80C167AD07FD2B0')

prepare() {
    cd "$srcdir"
    tar -xzvf "${pkgver}.tar.gz"
}

package() {
    install -Dm644 "${pkgname}-release-${pkgver}/htmlize.el" "$pkgdir/usr/share/emacs/site-lisp/htmlize.el"
    install -Dm644 "${pkgname}-release-${pkgver}/README.md" "$pkgdir/usr/share/doc/emacs-htmlize/README.md"
}
