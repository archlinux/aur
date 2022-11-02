pkgname=nextcloud-app-richdocuments
pkgver=7.0.1
pkgrel=2
pkgdesc="Integrate Collabora Online into NextCloud"
arch=('any')
url="https://github.com/nextcloud-releases/richdocuments"
license=('AGPL')
depends=('nextcloud>=25' 'nextcloud<26' 'nodejs' 'npm')
makedepends=()
options=('!strip')
source=("richdocuments-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/richdocuments-v${pkgver}.tar.gz")
sha512sums=('6a5300a8f13b977043619645ec2f413ab264e59b46a20c29ef56efdee891e1bf2aedc0b641458ad139de63c01b949e0c41d5961af26d939202c2cfa0cf891e99')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/richdocuments" "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocuments"
}
