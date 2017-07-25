# Maintainer: Gabriel-Andrew Pollo Guilbert <gabriel14_wii@hotmail.com>

pkgname=texlive-slashbox
pkgver=1993.05.27
pkgrel=1
pkgdesc='A LaTeX package for producing split cell.'
arch=('any')
url='https://ctan.org/pkg/slashbox'
license=('unknown')
depends=('texlive-core')
install='texlive-slashbox.install'
source=('http://mirrors.ctan.org/macros/latex/contrib/slashbox/slashbox.sty'
        'http://mirrors.ctan.org/macros/latex/contrib/slashbox/slashbox.tex')
md5sums=('ce2190dc09125c3010b0dfd2226dd182'
          'f8479d69e1d4e5583adb36d224cc10b6')

package() {
    mkdir -p "$pkgdir/usr/share/texmf/tex/latex/slashbox"

    cp "$srcdir/slashbox.sty" "$pkgdir/usr/share/texmf/tex/latex/slashbox"
    cp "$srcdir/slashbox.tex" "$pkgdir/usr/share/texmf/tex/latex/slashbox"
}


