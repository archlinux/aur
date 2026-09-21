pkgname=anitrack-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="CLI/TUI companion for ani-cli with watch-progress tracking (prebuilt binary)"
arch=("x86_64")
url="https://github.com/MiguelRegueiro/anitrack-cli"
license=("GPL-3.0-or-later")
depends=("ani-cli" "glibc" "gcc-libs")
provides=("anitrack")
conflicts=("anitrack")
source=("anitrack-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/MiguelRegueiro/anitrack-cli/releases/download/v${pkgver}/anitrack-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('b0eef9a2eb0e8c190ad20c3ec50d7e6f9af3407ca86041e76604976151a76367')

package() {
  install -Dm755 "$srcdir/anitrack" "$pkgdir/usr/bin/anitrack"
}
