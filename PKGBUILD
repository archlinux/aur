# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=dokuwiki-plugin-dw2pdf
pkgver=2020.08.20
pkgrel=1
pkgdesc="Fork of Luigi Micco's PDF export plugin for DokuWiki"
arch=('any')
url="http://www.dokuwiki.org/plugin:dw2pdf"
license=('GPL2')
depends=('dokuwiki')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/splitbrain/dokuwiki-plugin-dw2pdf/archive/2020-08-20.tar.gz")
sha512sums=('33cd235ca8158a4216d2313fc1d67cba0ba1fc89bba62ffaf23802a0cbd05cb6327e6a0f8e33383723d4b3e060c207b61cc1ffafef73dbaf7a8cfc1b2597bb11')

package() {
  install -d "${pkgdir}/usr/share/webapps/dokuwiki/lib/plugins"
  cp -a "${srcdir}/dokuwiki-plugin-dw2pdf-2020-08-20" "${pkgdir}/usr/share/webapps/dokuwiki/lib/plugins/dw2pdf"
}
