# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mk_vpp  
pkgver=3.05
pkgrel=3
pkgdesc="mk and vpp, two tools for the cyclic process of editing, compiling, viewing, and printing a latex, xelatex, or plain tex document."
url="http://www.ctan.org/pkg/mk"
arch=('any')
license=('GPL')
depends=('bash' 'texlive-core' 'texinfo')
source=(http://mirrors.ctan.org/support/latex_maker/mk
	http://mirrors.ctan.org/support/latex_maker/mk.pdf
	http://mirrors.ctan.org/support/view_print_ps_pdf/vpp
       	http://mirrors.ctan.org/support/view_print_ps_pdf/vpp.pdf)
md5sums=('57535f151ae13ea81b9f1b00a1e2c362'
         'd2df9a4a22a003207dd9b394ad371d80'
         '79033f3d4cf5bae6d14f9608717233fb'
         '5b9a6daa02205a160420d9b76efaa00b')

package() {
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/doc/$pkgname"
  install -m644 *.pdf "$pkgdir/usr/share/doc/$pkgname"
  install -m755 mk vpp "$pkgdir/usr/bin"
}
