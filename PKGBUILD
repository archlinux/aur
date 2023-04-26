# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=chyle-bin
pkgver=1.16.0
pkgrel=1
provides=('chyle')
pkgdesc="Changelog generator: use a git repository and various data sources and publish the result on external services"
arch=('x86_64')
url='https://github.com/antham/chyle'
license=('MIT')
depends=('glibc')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('6c4f77112dd1fc4873a36ca07210c23e78dd2aea3c73f5727d90961893172efb')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/chyle"
  install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}