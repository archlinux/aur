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
sha256sums=('eac666e563e359d26dd96a911222336568c65d9d57c549853305b142b148b293')

package() {
    install -Dm644 "100-noto-cjk-locale.conf" "${pkgdir}/etc/fonts/conf.d/100-noto-cjk-locale.conf"
}
