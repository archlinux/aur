# Maintainer: Joshua Li <josh@jrl.ninja>
# Please submit comments/issues here: https://github.com/JoshuaRLi/PKGBUILDs

pkgname=vape-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="A command-line tool that converts text into 'vaporwave' text - fullwidth UTF-8 characters."
arch=('x86_64')
_ghrepo_=vape
url="https://github.com/JoshuaRLi/${_ghrepo_}"
license=('MIT')
provides=('vape')
conflicts=('vape')
options=(!strip)

source_x86_64=("${url}/releases/download/v${pkgver}/vape-x86_64-unknown-linux-gnu")
sha512sums_x86_64=('3f13db177eb5aded8431c8ed2b190924f1b4027b99601c79e38e5fd09cd8005a17efdd849b34c6f717293f9a94220e0dabdff87635267ee59c9f45c3116dfef7')

package () {
  cd "$srcdir"
  install -Dm 755 vape-x86_64-unknown-linux-gnu "${pkgdir}/usr/bin/vape"
}
