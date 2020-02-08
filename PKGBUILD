# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=ttf-lora-cyrillic
pkgver=2.210
pkgrel=1
arch=(any)
license=(custom:OFL)
conflicts=(ttf-lora-cyrillic-ibx)
replaces=(ttf-lora-cyrillic-ibx)
url=http://www.cyreal.org/2012/07/lora/
source=("https://github.com/cyrealtype/Lora-Cyrillic/releases/download/v${pkgver}/Lora-Static.zip"
        "https://github.com/cyrealtype/Lora-Cyrillic/raw/v${pkgver}/OFL.txt")
sha512sums=('19c2e1c0d3dfac71df8347a115099ee812097155e8ea034b5ba9e079e0b36d156a6729723aaf7ff192f7269054c2e0da5dbd3447abf14fd1be06580130a358e6'
            '8fb63945341a02244ab3dc320f754af943dada136a8f0e93b1f5d240cec729b772824320b779df994bc2036fed7e3e8c8ff070ec008a3fd93133b3ecb6ba7660')

package () {
	install -m755 -d "${pkgdir}/usr/share/fonts/ttf-lora-cyrillic"
	install -m755 -t "${pkgdir}/usr/share/fonts/ttf-lora-cyrillic" *.ttf
	install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
