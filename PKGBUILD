# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gitql-bin
pkgver=2.0.0
pkgrel=2
pkgdesc='A git query language'
arch=('x86_64')
url="https://github.com/cloudson/gitql"
license=('MIT')
provides=('gitql')
source=("${pkgname}-${pkgver}.zip::https://github.com/cloudson/gitql/releases/download/${pkgver}/gitql-linux64.zip"
		'LICENSE::https://github.com/cloudson/gitql/raw/master/LICENSE')
sha256sums=('4be43c18bfa05bfb4fc0764c8a5453d9603067c9e5d74ba34f7b675b41f8f290'
			'ca995d876d4738b7f7309c46f443f42bc887db327ed183fe46733a59f06f80b5')

package() {
	install -Dm755 "${srcdir}/gitql-linux64"/gitql "${pkgdir}/usr/bin/gitql"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}" 
}
# vim:set ts=2 sw=2 et: