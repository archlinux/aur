# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mk_vpp # taken from mk 
pkgver=3.07
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
sha256sums=('3f1dea5243f11578fd36b75e1ebef3a42a8463e302d6db2a82c8ef6546bd3bb3'
            '82d220fc9bbea8afc55df21df7968d7356795e810d850c559341d6d1a95264bb'
            'ee915bf6d81bd7438f098527dd6cefd2122782d4266e7ae0dd334a42da6a4020'
            '58f66d3c76831394289b87ac50caef41611dae7e0d5c416b315fd3c85d6cd129')

package() {
  install -d "$pkgdir"/usr/bin "$pkgdir"/usr/share/doc/$pkgname
  install -m644 *.pdf "$pkgdir"/usr/share/doc/$pkgname
  install -m755 mk vpp "$pkgdir"/usr/bin
}
