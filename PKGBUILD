# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='ttf-lora-cyrillic'
pkgver='2.000'
pkgrel='1'
arch=('any')
license=('custom:OFL')
conflicts=('ttf-lora-cyrillic-ibx')
replaces=('ttf-lora-cyrillic-ibx')
url='https://github.com/cyrealtype/Lora-Cyrillic'
source=("${url}/files/520780/Lora-TTF.zip")
sha512sums=('53ab36c8d8200959caeada7887eb9dae53017dafa79621d8e9c7f5e8057426779e17ea41b4db8de56da0843dd3036b849054a65421ea10747e36b21c02d54967')

package () {
	install -m755 -d "${pkgdir}/usr/share/fonts/ttf-lora-cyrillic"
	install -m755 -t "${pkgdir}/usr/share/fonts/ttf-lora-cyrillic" *.ttf
	install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
