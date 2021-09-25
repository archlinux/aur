# Maintainer: Amy Wilson <awils_1 at xsmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fopnu
pkgver=1.55
pkgrel=2
pkgdesc='A new and powerful P2P File Sharing System'
arch=('x86_64')
url='https://www.fopnu.com'
license=("custom:${pkgname}")
depends=('gtk2' 'dbus-glib')
makedepends=('tar')
source=("${pkgname}-${pkgver}.deb::https://download2.fopnu.com/download/fopnu_${pkgver}-1_amd64.deb"
        'LICENSE')
sha256sums=('eef5ecc105a71d7d215d978ea102ee0370714b00cddd07b99a26a9f90552903a'
            '0bc342f6415aa54c3d313af6a45152cb005024c7167d4fd0c71bfa004a2f8e4f')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
