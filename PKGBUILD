# Maintainer: Toke Høiland-Jørgensen <toke@toke.dk>

pkgname=gajim-plugin-httpupload
_pkgname=httpupload
pkgver=0.4.3
pkgrel=2
pkgdesc="Gajim plugin for HTTP upload (XEP-0363)."
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/HttpUploadPlugin"
license=('GPL')
depends=("gajim" "python2-cryptography")
provides=('gajim-plugin-httpupload')
source=("${pkgname}-${pkgver}.zip::https://ftp.gajim.org/plugins_0.16_zip/${_pkgname}.zip")
sha256sums=('SKIP') # upstream checksum changes without the content being any different

package() {
  cd ${srcdir}/${_pkgname}

  # Install the plugin
  install -d ${pkgdir}/usr/share/gajim/plugins/httpupload
  cp -r * ${pkgdir}/usr/share/gajim/plugins/httpupload/
}

# vim:set ts=2 sw=2 et:
