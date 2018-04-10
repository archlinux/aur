# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mk_vpp # taken from mk 
pkgver=3.07
pkgrel=1
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
         'c0026eaad70c1e14429a17d2bfb4e349'
         '268bb53db0a2ff023826e6f7c8535ddd'
         '94c84e19dc7766b4edd8c6573a6f3f9e')

package() {
  install -d "$pkgdir"/usr/bin "$pkgdir"/usr/share/doc/$pkgname
  install -m644 *.pdf "$pkgdir"/usr/share/doc/$pkgname
  install -m755 mk vpp "$pkgdir"/usr/bin
}
