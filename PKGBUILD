pkgname=electron-launcher
pkgver=1.0
pkgrel=1
pkgdesc="Launcher script that forwards to the latest installed electronXX binary"
arch=('any')
license=('MIT')
depends=()
provides=('electron' 'electron-launcher')
conflicts=('electron' 'electron-nightly-bin')
replaces=('electron' 'electron-nightly-bin')
install=electron-launcher.install
source=('electron.sh')
sha256sums=('9d80a970fe40d7294b0a6f7587b6aa0107bbee46f45c07da39cdb53c4741c181')

package() {
    install -Dm755 "$srcdir/electron.sh" "$pkgdir/usr/bin/electron"
}
