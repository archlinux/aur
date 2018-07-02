# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=ttf-gidole
pkgdesc='Open Source Modern DIN typeface'
pkgver=0.7
pkgrel=1
url='http://gidole.github.io/'
license=(custom:OFL)
arch=(any)
source=("https://github.com/larsenwork/Gidole/raw/v.${pkgver}/Resources/Gidole.zip")
sha512sums=('6465679c42a9b54fd707f4d17f15e6c3e8ec9d0baa5cb50d2d6d398834b822ca0530894af3e4e3405547073f9063197452b570ad90c37c9abc9bb87707bd53b6')

package ()
{
	install -Dm644 Releases/Gidole-Regular.ttf \
		"${pkgdir}/usr/share/fonts/${pkgname}/Gidole-Regular.ttf"
	install -Dm644 Releases/License.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

