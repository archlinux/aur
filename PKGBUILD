# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=grinplusplus-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='A C++ Grin Node & Wallet For Linux'
arch=('x86_64')
url="https://grinplusplus.github.io"
license=('MIT')
provides=('grinplusplus')
conflicts=('grinplusplus')
depends=('gtk3'
         'libxss'
         'nss'
         'nodejs')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.deb::https://github.com/GrinPlusPlus/GrinPlusPlus/releases/download/v${pkgver}/GrinPlusPlus.${pkgver}.deb"
        'LICENSE::https://github.com/GrinPlusPlus/GrinPlusPlus/raw/master/LICENSE')
sha256sums=('f799f30b62bb85c66d391dad06648a222b6ebba48e1f6e0c05b846c268777ab3'
            'a5e9383c3cb97aa3034e5e4bf1c94a71db0c59b3a7ec1fbf198232fb9dcc5e53')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et: