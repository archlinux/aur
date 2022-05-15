# Maintainer: chocoearly44 <chocoearly44 at proton dot me>

pkgname=zapit
pkgver=1.1
pkgrel=2
pkgdesc='An advanced MQTT client made for the modern age'
arch=('x86_64' 'i686')
url='https://github.com/chocoearly44/ZapIt'
license=('MIT')
depends=('java-runtime>=17' 'xdg-utils')
source=("https://github.com/chocoearly44/ZapIt/releases/download/${pkgver}/zapit-${pkgver}.jar"
        'zapit.desktop'
        'icon.svg')
md5sums=('4a13267e3d7e83d2d0dd3d6bb975c80a'
        'd5f64bcad5ef5b31dee352ab17d1b251'
        'fd4772bfec535553874eb6d7207fdbf5')

package() {
        install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
        install -Dm644 "${srcdir}"/icon.svg "${pkgdir}"/usr/share/pixmaps/${pkgname}.svg
        install -Dm755 "${srcdir}"/zapit-${pkgver}.jar "${pkgdir}"/opt/${pkgname}/zapit.jar
}
