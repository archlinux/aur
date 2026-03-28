# Maintainer: Markus Leitermann <admin@ailinux.me>
pkgname=aicoder
pkgver=0.6.2
pkgrel=1
pkgdesc="Terminal Coding & DevOps Agent for AILinux/TriForce — 645+ models, GUI, System Tray"
arch=('x86_64')
url="https://github.com/derleiti/ai-coder"
license=('MIT')
depends=('glibc')
optdepends=('git: workspace support' 'python-pyqt6: GUI mode (aicoder gui)')
source=("aicoder-${pkgver}::https://github.com/derleiti/ai-coder/releases/download/v${pkgver}/aicoder-${pkgver}-x86_64-linux")
sha256sums=('8a3154cbb9ae363152aba83e48e1cf075e8a397a9c0f56a8496de690845b03c1')

package() {
    install -Dm755 "$srcdir/aicoder-${pkgver}" "$pkgdir/usr/bin/aicoder"
}
