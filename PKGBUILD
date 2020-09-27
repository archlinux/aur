# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=dokuwiki-plugin-captcha
pkgver=2019.03.20
pkgrel=2
pkgdesc="Use a CAPTCHA challenge to protect DokuWiki against automated spam"
arch=('any')
url="http://www.dokuwiki.org/plugin:captcha"
license=('GPL2')
depends=('dokuwiki')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/splitbrain/dokuwiki-plugin-captcha/archive/2019-03-20.tar.gz")
sha512sums=('1b6788bdfbf68cbfe51e6ef65f9a266c3b5781e0b9d5a285fb41c9ebb646cc54f0af6d925c39a76127aaab8e5c2f1e1d324e474829b8452cc1a60c3b3d08df6c')

package() {
  install -d "${pkgdir}/var/lib/dokuwiki/plugins"
  cp -a "${srcdir}/dokuwiki-plugin-captcha-2019-03-20" "${pkgdir}/var/lib/dokuwiki/plugins/captcha"
}
