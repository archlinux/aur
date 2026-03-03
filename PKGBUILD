# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=strace-tui-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.1
pkgrel=1
pkgdesc='A terminal user interface (TUI) for visualizing and exploring strace output - Binary build'
arch=(x86_64)
url='https://github.com/Rodrigodd/strace-tui'
license=('MIT')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/strace-tui-x86_64-unknown-linux-gnu.tar.gz"
    "LICENSE-APACHE::https://raw.githubusercontent.com/Rodrigodd/strace-tui/refs/tags/v$pkgver/LICENSE-APACHE"
    "LICENSE-MIT::https://raw.githubusercontent.com/Rodrigodd/strace-tui/refs/tags/v$pkgver/LICENSE-MIT")
provides=('strace-tui')
conflicts=($_pkgname)
sha256sums=('b7579e37a0e01c5ea77584292f7af284b1c0e0bf199981665828237f0f27a42c'
            'eb05d6b88d26a5ba2c0545a08ae89d4944b317142159bea7566cece2084b6aa4'
            'bf2ad3dbaa5ac44fbfa8e91227b304099412501750d912e2a1ab520d277faef8')

package() {
    # cd "$_pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT" LICENSE-MIT
}

# vim: ts=4 sw=4 et:
