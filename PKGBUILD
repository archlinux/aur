# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=grinplusplus-bin
pkgver=1.1.3
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
sha256sums=('ee537af557e1fb05f6b9bea4527d3cccbe2701c34005564ecbf723ef3a946b23'
            'a5e9383c3cb97aa3034e5e4bf1c94a71db0c59b3a7ec1fbf198232fb9dcc5e53')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
