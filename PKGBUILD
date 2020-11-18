# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=wellington-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="Adds spriting to the lightning fast libsass. No need to learn a new tool, this all happens right in your Sass"
arch=('x86_64')
url='http://getwt.io'
license=('Apache')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wellington/wellington/releases/download/v${pkgver}/wt_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('e144166fc6009a79e44f037db90879308eca00b7c6eff7f1569c24257035389e')

package() {
  install -Dm755 "${srcdir}/wt" "${pkgdir}/usr/bin/wt"
}
