# Maintainer: lostf1sh <lostf1sh@users.noreply.github.com>
pkgname=pomo-cli-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Terminal-based pomodoro timer with TUI, session tracking, and statistics (prebuilt binary)"
arch=('x86_64')
url="https://github.com/lostf1sh/pomo"
license=('MIT')
depends=('glibc')
provides=('pomo')
conflicts=('pomo' 'pomo-cli')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pomo-$pkgver-linux-x86_64.tar.gz")
sha256sums=('5e6663323fe9f5e89a46ba9f3862f6e15ca7a8f0dcd792e797596764c29a1877')

package() {
    install -Dm755 pomo-cli "$pkgdir/usr/bin/pomo"
}
