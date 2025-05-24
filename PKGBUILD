# Maintainer: al-ce <23170004+al-ce@users.noreply.github.com>
pkgname=terminal-yt-bin
pkgver=2.0.5
pkgrel=1
pkgdesc="A small newsboat-inspired terminal YouTube subscription manager written in Rust (binary)"
arch=('x86_64')
url="https://github.com/jooooscha/terminal-yt"
license=('GPL3')
depends=('mpv')
provides=('terminal-yt')
conflicts=('terminal-yt' 'terminal-yt-git')
source=("$url/releases/download/v$pkgver/tyt-linux.tar.gz")
sha256sums=('3b47bb354255370ca62747b032dba02669141847e3e19bd6ef59d317822427cc')

package() {
    install -Dm755 "tyt" "$pkgdir/usr/bin/tyt"
}
