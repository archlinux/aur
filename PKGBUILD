# Maintainer: Markus Leitermann <admin@ailinux.me>
pkgname=aicoder
pkgver=0.6.0
pkgrel=1
pkgdesc="Terminal Coding & DevOps Agent for AILinux/TriForce — 645+ models, GUI, System Tray"
arch=('x86_64')
url="https://github.com/derleiti/ai-coder"
license=('MIT')
depends=('glibc')
optdepends=('git: workspace support' 'python-pyqt6: GUI mode (aicoder gui)')
source=("aicoder-${pkgver}::https://github.com/derleiti/ai-coder/releases/download/v${pkgver}/aicoder-${pkgver}-x86_64-linux")
sha256sums=('c2de3e07fa0627411409c0ac87604759ed395c40b6aeec26183fddf2e3d518b2')

package() {
    install -Dm755 "$srcdir/aicoder-${pkgver}" "$pkgdir/usr/bin/aicoder"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" << 'LICEOF'
MIT License — Copyright (c) 2026 Markus Leitermann / AILinux
LICEOF
}
