# Maintainer: Andrej Radović (r.andrej@gmail.com)

pkgname=otf-xcharter
pkgver=1.26
pkgrel=3
pkgdesc="Extension of Bitstream Charter, which provides small caps, "\
"oldstyle figures and superior figures in all four styles, Cyrillic and Greek."
url="https://www.ctan.org/pkg/xcharter"
arch=('any')
license=('custom:LPPL')
source=(xcharter-${pkgver}.zip::http://mirrors.ctan.org/fonts/xcharter.zip)
sha1sums=('5aa9190af4ef8cf875986a29ae3e52591459662a')

package() {
	install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
    cd xcharter/opentype
	install -m644 *.otf "${pkgdir}"/usr/share/fonts/"${pkgname}"
}
