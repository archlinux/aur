# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=modern-beep
pkgver=0.1.0
pkgrel=2
pkgdesc="A modern Rust alternative to the classic \`beep\` command with support for notifications, webhooks, and remote audio playback"
arch=('x86_64')
url="https://github.com/skorotkiewicz/modern-beep"
license=('MIT')
depends=('glibc')
conflicts=('beep')
provides=('beep')
options=(!strip)
source_x86_64=("beep-${pkgver}-linux-x86_64.tar.gz::https://github.com/skorotkiewicz/modern-beep/releases/download/v${pkgver}/beep-linux-x86_64.tar.gz")
sha256sums_x86_64=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 "beep" "$pkgdir/usr/bin/beep"
}