# Maintainer: Fofo Rivera <foforivera@gmail.com>
pkgname=pocketcli
pkgver=1.9.1
pkgrel=1
pkgdesc="Terminal UI client for Pocket Casts - browse podcasts, sync playback, manage subscriptions"
arch=('any')
url="https://github.com/foforivera/pocketcli"
license=('MIT')
depends=('python' 'python-httpx' 'mpv')
source=("pocketcli.py::https://raw.githubusercontent.com/foforivera/pocketcli/v${pkgver}/pocketcli.py")
sha256sums=('35398fe798d921ead12a18cfa93c8f09d4317f4185d3d427fce0469cf871f035')

package() {
    install -Dm755 "${srcdir}/pocketcli.py" "${pkgdir}/usr/bin/pocketcli"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'LICENSE'
MIT License - Copyright (c) 2026 Fofo Rivera
LICENSE
}
