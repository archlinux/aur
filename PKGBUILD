# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=noto-fonts-cjk-locale-conf
pkgver=1.0
pkgrel=1
pkgdesc="Make noto-fonts-cjk display correctly according to locale"
arch=('any')
license=('GPLv3')
depends=(
	'fontconfig'
    'noto-fonts-cjk'
)
source=('100-noto-cjk-locale.conf')
sha256sums=('1ef940b20067760f76521ab91250a6501ef1092a977eb35655186de535d8290b')

package() {
    install -Dm644 "100-noto-cjk-locale.conf" "${pkgdir}/etc/fonts/conf.d/100-noto-cjk-locale.conf"
}
