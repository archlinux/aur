# Maintainer: desbma
pkgname=ttf-icomoon-feather
pkgver=1.0
pkgrel=2
pkgdesc='Icomoon feather font'
arch=('any')
url='https://github.com/adi1090x/polybar-themes/tree/master/fonts/panels'
license=('GPL3')
source=('icomoon-feather.ttf::https://github.com/adi1090x/polybar-themes/blob/4b0e9a95d48cc3e9b85934d33fcb776eae4a7bd7/polybar-4/fonts/icomoon-feather.ttf?raw=true')
sha512sums=('535a323a85c0d513e0cc9e03f497477b398a3a2e587d9cbf2487830f136da6ffb61e1ff4c3e6f9fb4cf628c557068541e306e88269173eac8e5937a7adfbe519')

package() {
    install -Dm 644 -t "${pkgdir}/usr/share/fonts/TTF" icomoon-feather.ttf
}
