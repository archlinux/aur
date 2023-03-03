# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ppet3-bin
_pkgname=PPet3
pkgver=3.3.0
pkgrel=2
pkgdesc="Put a cute girl on your desk for more fun.在你的桌面放一个萌妹子，多一点乐趣"
arch=('x86_64')
url="https://github.com/zenghongtu/PPet"
license=('MIT')
conflicts=()
depends=('gtk3' 'at-spi2-core' 'nss' 'alsa-lib')
options=()
source=(
  "${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.deb"
)
sha512sums=('fae74eaa7bc42ca56e1d85d1c01810565a56eca10ca87c28e27d44b285a158831f022a15bea6991cebc190de73b23b083af1210f0d2f332fda2139cb67afb8d6')
package() {
    bsdtar -xvf data.tar.xz -C ${pkgdir}
}
