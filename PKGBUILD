# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>

pkgname=popup-translate
pkgver=1.0.0
pkgrel=1
pkgdesc="Translate any text you select on your Linux Desktop with a keyboard-shortcut (please set in Settings/Keyboard) to your default system-language or English"
arch=('any')
url='https://github.com/schinfo/popup-translate'
license=('GPL2')
depends=('translate-shell' 'xclip' 'yad')
source=("https://github.com/schinfo/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4c3770f80e269fd1f8db21d55167d74f222fee8759f94ae58adc28b1d57e5196')

package() {
	install -Dm0755 "${pkgname}-${pkgver}/popup-translate" -t "$pkgdir/usr/local/bin"
	install -Dm0755 "${pkgname}-${pkgver}/popup-translate-en" -t "$pkgdir/usr/local/bin"
}
