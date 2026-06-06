# Maintainer: Fofo Rivera <foforivera@gmail.com>
pkgname=pocketcli
pkgver=1.6.1
pkgrel=1
pkgdesc="Terminal UI client for Pocket Casts - browse podcasts, sync playback, manage subscriptions"
arch=('any')
url="https://github.com/foforivera/pocketcli"
license=('MIT')
depends=('python' 'python-httpx' 'mpv')
source=("pocketcli.py::https://raw.githubusercontent.com/foforivera/pocketcli/v${pkgver}/pocketcli.py")
sha256sums=('e4991f165bb2afb58526819aa0a761381471ddb5e8ffa22fedc03b5282aaefdf')

package() {
    install -Dm755 "${srcdir}/pocketcli.py" "${pkgdir}/usr/bin/pocketcli"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'LICENSE'
MIT License - Copyright (c) 2026 Fofo Rivera
LICENSE
}
