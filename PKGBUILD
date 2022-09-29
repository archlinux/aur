# Maintainer: Hemish <hemish04082005@gmail.com>
pkgname=ttf-sundarbharati
pkgver=1.0
pkgrel=2
pkgdesc="SundarBharati - a font for Bharati script"
arch=('any')
url="https://bharatiscript.com"
license=('custom')
source=("https://bharatiscript.com/media/Fonts/SundarBharati-Regular.otf")
md5sums=('SKIP')

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/OTF"
    install -m 644 SundarBharati-Regular.otf "${pkgdir}/usr/share/fonts/OTF/SundarBharati-Regular.otf"
}
