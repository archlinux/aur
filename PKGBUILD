# Maintainer: katoitalia

pkgname=librone
pkgver=1.3
pkgrel=1
pkgdesc='scarica e-book in italiano | ebook | companion per calibre'
arch=('any')
url='https://github.com/kitalia/librone'
license=('GPL2')
provides=('librone')
source=("https://raw.githubusercontent.com/kitalia/librone/main/librone.sh"
	"https://github.com/kitalia/librone/raw/main/librone.png"
	"https://github.com/kitalia/librone/raw/main/librone.desktop"
	)

md5sums=('823d7a1d8e10950411d7b8df74969211'
	 '2e16b5a15dd9ec02dd10dcfa588bd2cd'
	 'f0b45569eb070685113c73332d1798f2'
	)

package() {
  cd "${srcdir}"
  install -Dm755 "${srcdir}/librone.sh" "${pkgdir}/usr/bin/librone"
  install -Dm644 "${srcdir}/librone.png" "${pkgdir}/usr/share/pixmaps/librone.png"
  install -Dm644 "${srcdir}/librone.desktop" "${pkgdir}/usr/share/applications/librone.desktop"
}
