# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=dokuwiki-plugin-dw2pdf
pkgver=2021.02.07
pkgrel=1
pkgdesc="Fork of Luigi Micco's PDF export plugin for DokuWiki"
arch=('any')
url="http://www.dokuwiki.org/plugin:dw2pdf"
license=('GPL2')
depends=('dokuwiki')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/splitbrain/dokuwiki-plugin-dw2pdf/archive/${pkgver//\./-}.tar.gz")
sha512sums=('2e91d61511fff360170ec926a35f54de90393badb0fc4a5db0565ec81ff92a8a7eb539152b9151c1fd521d40a476013a93defeef14916df9e11f4e76fce30e69')

package() {
  install -d "${pkgdir}/var/lib/dokuwiki/plugins"
  cp -a "${srcdir}/dokuwiki-plugin-dw2pdf-${pkgver//\./-}" "${pkgdir}/var/lib/dokuwiki/plugins/dw2pdf"
}
