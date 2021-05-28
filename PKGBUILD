# Maintainer: Salif Mehmed <mail@salif.eu>
pkgname=sinhrz-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='A simple folder synchronization tool'
arch=('any')
url="https://github.com/salif/sinhrz"
license=('Apache')
depends=('java-runtime')
source=("https://github.com/salif/sinhrz/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}.tar")
md5sums=('fa0549baed68fdcb6eeb03e19f4729d6')

package() {
	cd "${pkgname%-bin}-v${pkgver}"
    install -Dm644 app.jar "${pkgdir}"/usr/lib/sinhrz/app.jar
    install -Dm755 sinhrz "${pkgdir}"/usr/bin/sinhrz
    install -Dm755 sinhrz-gui "${pkgdir}"/usr/bin/sinhrz-gui
    install -Dm644 sinhrz.desktop "${pkgdir}"/usr/share/applications/sinhrz.desktop
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname%-bin}"/LICENSE
}
