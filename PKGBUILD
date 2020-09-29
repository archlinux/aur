# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=chyle-bin
pkgver=1.11.0
pkgrel=1
provides=('chyle')
pkgdesc="Changelog generator: use a git repository and various data sources and publish the result on external services"
arch=('x86_64')
url='https://github.com/antham/chyle'
license=('MIT')
depends=('glibc')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/chyle_linux_amd64"
  'LICENSE::https://raw.githubusercontent.com/antham/chyle/master/LICENSE.txt')
sha256sums=('eedaac488efe473f8437d412be67dc8eb0b991f791e0faf7df9ee23f6e0724ff'
            '74d52f9acb64851447fbb6618cdb58a693ca07c9bfec17076e415f752c81cffa')

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver} "${pkgdir}/usr/bin/chyle"
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
