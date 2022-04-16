# Maintainer: FKonAUR <fkonaur at googlegroups dot com>
# Maintainer: Amy Wilson <awils_1 at xsmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=fopnu
pkgver=1.57
pkgrel=1
pkgdesc='A new and powerful P2P File Sharing System'
arch=('x86_64')
url='https://www.fopnu.com'
license=("custom:${pkgname}")
depends=('gtk2' 'dbus-glib')
makedepends=('tar')
source=("${pkgname}-${pkgver}.deb::https://download2.fopnu.com/download/fopnu_${pkgver}-1_amd64.deb"
        'LICENSE')
sha256sums=('db3d970f1cd4eb490491ccece9e1460094f36ec409cf580e8a2484a0d4e95b9b'
            '0bc342f6415aa54c3d313af6a45152cb005024c7167d4fd0c71bfa004a2f8e4f')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
