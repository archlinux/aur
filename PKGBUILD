# Maintainer: Fofo Rivera <foforivera@gmail.com>
pkgname=pocketcli
pkgver=1.8.0
pkgrel=1
pkgdesc="Terminal UI client for Pocket Casts - browse podcasts, sync playback, manage subscriptions"
arch=('any')
url="https://github.com/foforivera/pocketcli"
license=('MIT')
depends=('python' 'python-httpx' 'mpv')
source=("pocketcli.py::https://raw.githubusercontent.com/foforivera/pocketcli/v${pkgver}/pocketcli.py")
sha256sums=('a0bb3be69ed2e88de90c301d941161d389d22d64eebfc52abfcb0ad82c0fb51c')

package() {
    install -Dm755 "${srcdir}/pocketcli.py" "${pkgdir}/usr/bin/pocketcli"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'LICENSE'
MIT License - Copyright (c) 2026 Fofo Rivera
LICENSE
}
