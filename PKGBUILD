# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=dokuwiki-template-argon
pkgver=1.3
pkgrel=2
pkgdesc="Dokuwiki Template based on the Argon Design System"
arch=('any')
url="https://www.dokuwiki.org/template:argon"
license=('MIT')
depends=('dokuwiki')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/IceWreck/Argon-Dokuwiki-Template/archive/v${pkgver}.tar.gz")
sha512sums=('529a990b4f765b026412df4a54d7b1dc9445c37ae0a301b1189b224a54841e94b64a2c169627d3f6e718f491b8d598985487812daed272b5d2aa50e61439946d')

package() {
  install -d "${pkgdir}/var/lib/dokuwiki/tpl"
  cp -a "${srcdir}/Argon-Dokuwiki-Template-${pkgver}" "${pkgdir}/var/lib/dokuwiki/tpl/argon"
}
