# Maintainer: Andrej Radović (r.andrej@gmail.com)

pkgname=otf-xcharter
pkgver=1.209
pkgrel=1
depends=('fontconfig')
pkgdesc="Extension of Bitstream Charter, which provides small caps, "\
"oldstyle figures and superior figures in all four styles, Cyrillic and Greek."
url="https://www.ctan.org/pkg/xcharter"
arch=('any')
license=('custom:LPPL')
source=(http://mirrors.ctan.org/fonts/xcharter.zip)
sha1sums=('ae29343d57e22854564afa7172de6d638d84ea27')

package() {
	install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
    cd xcharter/opentype
    ls
	install -m644 *.otf "${pkgdir}"/usr/share/fonts/"${pkgname}"
}
