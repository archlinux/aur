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
sha256sums=('78e05c3cb68dba424c509080505d20cf042a05c44adba68ea0ffed9ee4a106a7')

package() {
    install -Dm644 "100-noto-cjk-locale.conf" "${pkgdir}/etc/fonts/conf.d/100-noto-cjk-locale.conf"
}
