pkgname=nextcloud-app-richdocuments
pkgver=7.1.0
pkgrel=1
pkgdesc="Integrate Collabora Online into NextCloud"
arch=('any')
url="https://github.com/nextcloud-releases/richdocuments"
license=('AGPL')
depends=('nextcloud>=25' 'nextcloud<26' 'nodejs' 'npm')
makedepends=()
options=('!strip')
source=("richdocuments-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/richdocuments-v${pkgver}.tar.gz")
sha512sums=('1c79d819a18d3be528082d1c56af2f0e236b8cb9e4778b969005df34d35fa2fa373ce76651a9605f974b703d827c8384cac96ea1b41e266d9bed80e651a8d753')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/richdocuments" "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocuments"
}
