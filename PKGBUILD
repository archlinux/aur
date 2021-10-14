# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=dokuwiki-plugin-dw2pdf
pkgver=2021.07.22
pkgrel=1
pkgdesc="Fork of Luigi Micco's PDF export plugin for DokuWiki"
arch=('any')
url="http://www.dokuwiki.org/plugin:dw2pdf"
license=('GPL2')
depends=('dokuwiki')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/splitbrain/dokuwiki-plugin-dw2pdf/archive/${pkgver//\./-}.tar.gz")
sha512sums=('342322a0ba457c2df6dbe453e0b09d6d2e05901739c3ab00d4922c9cce582bf6e3131133dd3b29ec2b1af687da3c76163fc72e0ce9491f9c7e40af0061e2f749')

package() {
  install -d "${pkgdir}/var/lib/dokuwiki/plugins"
  cp -a "${srcdir}/dokuwiki-plugin-dw2pdf-${pkgver//\./-}" "${pkgdir}/var/lib/dokuwiki/plugins/dw2pdf"
}
