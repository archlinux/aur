# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_fontname=zxx
pkgname=otf-$_fontname
pkgver=1.0
pkgrel=3
pkgdesc="Free Open Type Font to open up governments."
arch=('any')
license=('OFL')
url="http://z-x-x.org/"
depends=('fontconfig' 'xorg-font-utils')
install=$_fontname.install
source=("http://dl.dropbox.com/u/20517415/ZXX.zip" $_fontname.install)
sha256sums=('1e366d55ded45e298e696a919eb1854bb1c4144583bea7730669600e76264450'
            'e47acc1eab727dfd19a66dc0e86a78b5efd2968b899f6047406e4a622cefed5b')

package() {
	cd ${srcdir}/ZXX
	install -dm755 "${pkgdir}/usr/share/fonts/OTF/${_group}"
	install -Dpm644 *.otf "${pkgdir}/usr/share/fonts/OTF/${_group}"

	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dpm644 *.rtf "${pkgdir}/usr/share/doc/${pkgname}/"
}

