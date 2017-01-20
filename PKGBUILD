# Original author: Hanno Rein (hanno[AT]hanno-rein.de)
# Maintainer: Jakob Jungreithmeir <https://aur.archlinux.org/account/JakobJung>
# Last edited: 20th January 2017

pkgname=texlive-coffee-stains
pkgver=4.0
pkgrel=1
_reldate=2012-05-25
license=('Custom FOSS')
depends=('texlive-core')
pkgdesc="A LaTeX package for drawing coffee stains using pgf/tikz"
url="http://hanno-rein.de/archives/349"
arch=('any')
install="${pkgname}".install
_source_file_name=coffee4
source=(http://hanno-rein.de/downloads/${_source_file_name}.tar.gz
        LICENSE)
md5sums=('419e2a2f352da52733c0cbfb03534e40' '1c0d717000b8d526c5e3f6abed1e6012')

package() {
  install -Dm644 "$srcdir/${_source_file_name}.sty" "$pkgdir/usr/share/texmf-dist/tex/latex/${_source_file_name}/${_source_file_name}.sty"
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
