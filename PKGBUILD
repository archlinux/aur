# Maintainer: Markus Leitermann <admin@ailinux.me>
pkgname=aicoder
pkgver=1.0.0
pkgrel=1
pkgdesc="Agentic coding workstation for AILinux/TriForce with GUI, MCP registry and local OS tools"
arch=('x86_64')
url="https://github.com/derleiti/ai-coder"
license=('MIT')
depends=('glibc')
optdepends=('git: workspace support')
source=("aicoder::https://github.com/derleiti/ai-coder/releases/download/v1.0.0/aicoder")
sha256sums=('32c69a0ea3a23b33c2588caf2e058c1f1745d11b788875e47be79cf1095d279c')

package() {
    install -Dm755 "$srcdir/aicoder" "$pkgdir/usr/bin/aicoder"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" << 'LICEOF'
MIT License — Copyright (c) 2026 Markus Leitermann / AILinux
LICEOF
}
