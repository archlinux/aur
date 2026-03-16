# Maintainer: lostf1sh <lostf1sh@users.noreply.github.com>
pkgname=pomo-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal-based pomodoro timer with TUI, session tracking, and statistics (prebuilt binary)"
arch=('x86_64')
url="https://github.com/lostf1sh/pomo"
license=('MIT')
depends=('glibc')
provides=('pomo')
conflicts=('pomo' 'pomo-cli')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pomo-$pkgver-linux-x86_64.tar.gz")
sha256sums=('bbba8de85f49ca0ccdc98acfe89841d5243375dfaa335671c36bcf7e9106e74a')

package() {
    install -Dm755 pomo-linux-x86_64 "$pkgdir/usr/bin/pomo"
}
