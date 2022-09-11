# Maintainer: chocoearly44 <chocoearly44@proton.me>

pkgname=zapit
pkgver=1.2
pkgrel=1
pkgdesc='An advanced MQTT client made for the modern age'
arch=('x86_64' 'i686')
url='https://github.com/chocoearly44/ZapIt'
license=('MIT')
depends=('jre-openjdk>=18.0.2.u9-1' 'xdg-utils')
source=("https://github.com/chocoearly44/ZapIt/releases/download/${pkgver}/zapit-${pkgver}.jar"
        'zapit.desktop'
        'icon.svg')
md5sums=('317ee3600de8cb1444f19119acfe80f3'
        '1cd9948e5b4072e3b65913ab69c9b61d'
        'fd4772bfec535553874eb6d7207fdbf5')

package() {
        install -Dm644 "${srcdir}"/zapit.desktop "${pkgdir}"/usr/share/applications/zapit.desktop
        install -Dm644 "${srcdir}"/icon.svg "${pkgdir}"/usr/share/pixmaps/zapit.svg
        install -Dm755 "${srcdir}"/zapit-${pkgver}.jar "${pkgdir}"/usr/share/java/zapit/zapit.jar
}
