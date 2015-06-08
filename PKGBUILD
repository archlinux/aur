# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=libreoffice-extension-ooo2gd
_extname=ooo2gd
pkgver=3.0.0
pkgrel=1
pkgdesc="Export & Import to Google Docs for LibreOffice"
arch=('any')
url="http://extensions.libreoffice.org/extension-center/openoffice.org2googledocs-export-import-to-google-docs-zoho-webdav"
license=('GPL2')
depends=('libreoffice')
source=("http://extensions.libreoffice.org/extension-center/openoffice.org2googledocs-export-import-to-google-docs-zoho-webdav/releases/${pkgver}/${_extname}_${pkgver}.oxt")
md5sums=('31d7e111b1135f14717f21255d933f6e')

package() {
  install -d -m755 $pkgdir/usr/lib/libreoffice/share/extensions/$_extname

  cp -r * $pkgdir/usr/lib/libreoffice/share/extensions/$_extname
  rm $pkgdir/usr/lib/libreoffice/share/extensions/$_extname/*.oxt
}
