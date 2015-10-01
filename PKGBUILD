# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mk_vpp # taken from mk 
pkgver=3.06
pkgrel=2
pkgdesc="mk and vpp, two tools for the cyclic process of editing, compiling, viewing, and printing a latex, xelatex, or plain tex document."
url="http://www.ctan.org/pkg/mk"
arch=('any')
license=('GPL')
depends=('bash' 'texlive-core' 'texinfo')
source=(http://mirrors.ctan.org/support/latex_maker/mk
	http://mirrors.ctan.org/support/latex_maker/mk.pdf
	http://mirrors.ctan.org/support/view_print_ps_pdf/vpp
       	http://mirrors.ctan.org/support/view_print_ps_pdf/vpp.pdf)
md5sums=('b0c071c9d9d5951644cd65bd1b796add'
         '1ad057c8983d726b12a9167996821662'
         'cb7006d4a75d625154b901741ce4ecdc'
         'a34d12a41e118db05d784f1dc5f87cb2')

package() {
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/doc/$pkgname"
  install -m644 *.pdf "$pkgdir/usr/share/doc/$pkgname"
  install -m755 mk vpp "$pkgdir/usr/bin"
}
