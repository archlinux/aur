pkgname=keepass-plugin-keecloud
pkgver=1.2.0.3
pkgrel=1
pkgdesc="Adds support to several online file services to the built in URL file access in KeePass."
license=('MIT')
depends=('keepass')
arch=('any')
url='https://bitbucket.org/devinmartin/keecloud/overview'
_plgname="KeeCloud-${pkgver}.plgx"
source=("https://bitbucket.org/devinmartin/keecloud/downloads/${_plgname}")
noextract=($_plgname)
sha256sums=('579539c6b1fb8b5541629d780b65cdcc08e95025c998c3ed489f9334bea2100f')

package() {
  install -Dm644 "${srcdir}/${_plgname}" "${pkgdir}/usr/share/keepass/plugins/${_plgname}"
}
