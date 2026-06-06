# Maintainer: Fofo Rivera <foforivera@gmail.com>
pkgname=pocketcli
pkgver=1.7.0
pkgrel=1
pkgdesc="Terminal UI client for Pocket Casts - browse podcasts, sync playback, manage subscriptions"
arch=('any')
url="https://github.com/foforivera/pocketcli"
license=('MIT')
depends=('python' 'python-httpx' 'mpv')
source=("pocketcli.py::https://raw.githubusercontent.com/foforivera/pocketcli/v${pkgver}/pocketcli.py")
sha256sums=('f5cfa30844ead9a3418a264e3db2e472f773f62dc69440cc029ba9d84c70269f')

package() {
    install -Dm755 "${srcdir}/pocketcli.py" "${pkgdir}/usr/bin/pocketcli"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'LICENSE'
MIT License - Copyright (c) 2026 Fofo Rivera
LICENSE
}
