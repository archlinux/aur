# Maintainer: lostf1sh <lostf1sh@users.noreply.github.com>
pkgname=pomo-cli-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Terminal-based pomodoro timer with TUI, session tracking, and statistics (prebuilt binary)"
arch=('x86_64')
url="https://github.com/lostf1sh/pomo"
license=('MIT')
depends=('glibc')
provides=('pomo')
conflicts=('pomo' 'pomo-cli')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pomo-$pkgver-linux-x86_64.tar.gz")
sha256sums=('588190857e703a5f748a8502d5551fe2c96ea0e84b910f1b41f62b12bec90d39')

package() {
    install -Dm755 pomo-cli "$pkgdir/usr/bin/pomo"
}
