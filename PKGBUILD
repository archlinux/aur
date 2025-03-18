# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=noto-fonts-cjk-glyph-conf
pkgver=1.0
pkgrel=1
pkgdesc="Fix the problem that noto-fonts-cjk's glyph is too high in Pango(GNOME)"
arch=('any')
license=('GPLv3')
depends=(
	'fontconfig'
    'noto-fonts-cjk'
)
source=('100-noto-cjk-glyph.conf')
sha256sums=('7c4374860479648e3ee2d21e93e4f4dc3121c2c79b57f742787fba7a679d9b0d')

package() {
    install -Dm644 "100-noto-cjk-glyph.conf" "${pkgdir}/etc/fonts/conf.d/100-noto-cjk-glyph.conf"
}
