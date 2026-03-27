# Maintainer: Markus Leitermann <admin@ailinux.me>
pkgname=aicoder
pkgver=0.5.14
pkgrel=1
pkgdesc="Terminal Coding & DevOps Agent for AILinux/TriForce — 659+ models, GUI, System Tray"
arch=('x86_64')
url="https://github.com/derleiti/ai-coder"
license=('MIT')
depends=('glibc')
optdepends=('git: workspace support' 'python-pyqt6: GUI mode (aicoder gui)')
source=("aicoder-${pkgver}::https://github.com/derleiti/ai-coder/releases/download/v${pkgver}/aicoder-${pkgver}-x86_64-linux")
sha256sums=('2744ec71afda7da9aa7e3ad6f8eb5c9022410ca7793cf4260a6a34b76360ed3c')

package() {
    install -Dm755 "$srcdir/aicoder-${pkgver}" "$pkgdir/usr/bin/aicoder"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" << 'EOF'
MIT License — Copyright (c) 2026 Markus Leitermann / AILinux
EOF
}
