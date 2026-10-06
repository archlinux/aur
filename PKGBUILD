# Maintainer: Nacho-Telmo <ignacio.ezcurra@yahoo.com.ar>
pkgname=sinergia-appimage-manager
pkgver=1.0.0
pkgrel=2
pkgdesc="Un gestor moderno y oscuro de AppImages para Linux con integración en KDE/Wayland"
arch=('any')
url="https://github.com/Nacho-Telmo/sinergia-appimage-manager"
license=('GPL3')
depends=('python' 'python-pyqt6')
optdepends=('desktop-file-utils: para actualizar la base de datos de escritorios')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nacho-Telmo/sinergia-appimage-manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('PEGAR_AQUÍ_EL_NUEVO_HASH_SHA256')

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 appimage-manager.py "$pkgdir/usr/bin/appimage-manager"
    install -Dm644 appimage-manager.desktop "$pkgdir/usr/share/applications/sinergia.desktop"
    install -Dm644 sinergia.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/sinergia.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
