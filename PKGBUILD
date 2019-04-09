# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname="markdown-mime-type"
pkgver='1.0.0'
pkgrel=1
pkgdesc='MIME file type for the markdown format'
arch=('x86_64' 'i686')
url="https://aur.archlinux.org/packages/${pkgname}/"
license=('GPL3')
options=('!strip')
source=('text-markdown.xml')
sha256sums=('2023f934586dda2faffbfccc856f6ce2332d3108434f4615c5cf80f49a8cdfdf')

package() {

	cd "${srcdir}"

	install -dm755 "${pkgdir}/usr/share/mime/packages"
	install -Dm644 "${srcdir}/text-markdown.xml" "${pkgdir}/usr/share/mime/packages/text-markdown.xml"

}

