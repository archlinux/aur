# Maintainer: chocoearly44 <chocoearly44@proton.me>

pkgname=zapit
pkgver=1.2
pkgrel=2
pkgdesc='An advanced MQTT client made for the modern age'
arch=('x86_64' 'i686')
url='https://github.com/chocoearly44/ZapIt'
license=('MIT')
depends=('jre-openjdk>=19.0.1.u10-3' 'xdg-utils')
source=("https://github.com/chocoearly44/ZapIt/releases/download/${pkgver}/zapit-${pkgver}.jar"
        'zapit.desktop'
        'icon.svg'
)
md5sums=('317ee3600de8cb1444f19119acfe80f3'
        'f691febddcbd36da56e5f66717b8c3e6'
        'fd4772bfec535553874eb6d7207fdbf5'
)
package() {
        install -Dm644 "${srcdir}"/zapit.desktop "${pkgdir}"/usr/share/applications/zapit.desktop
        install -Dm644 "${srcdir}"/icon.svg "${pkgdir}"/usr/share/pixmaps/zapit.svg
        install -Dm755 "${srcdir}"/zapit-${pkgver}.jar "${pkgdir}"/usr/share/java/zapit/zapit.jar
}
