# Maintainer: Grant Moyer <code@grantmoyer.com>
pkgname=calibre-plugin-goodreads
pkgver=1.8.5
pkgrel=1
pkgdesc="Downloads metadata and covers from Goodreads - Calibre Plugin"
arch=('any')
url="https://github.com/kiwidude68/calibre_plugins/tree/main/goodreads"
license=('GPL3')
depends=('calibre>=2.0.0')
source=("https://github.com/kiwidude68/calibre_plugins/releases/download/goodreads-${pkgver}/goodreads-${pkgver}.zip")
noextract=("goodreads-${pkgver}.zip")
sha256sums=('c76f97fc3976f4196ffd616ab6e47dfbd98033fe6fd4c736bed47503a17a5b22')

package() {
	install -m644 -D "${srcdir}/goodreads-${pkgver}.zip" "${pkgdir}/usr/share/calibre/system-plugins/goodreads-${pkgver}.zip"
}
