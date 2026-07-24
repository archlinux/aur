pkgname=anitrack-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="CLI/TUI companion for ani-cli with watch-progress tracking (prebuilt binary)"
arch=("x86_64")
url="https://github.com/MiguelRegueiro/anitrack-cli"
license=("GPL-3.0-or-later")
depends=("ani-cli" "glibc" "gcc-libs")
provides=("anitrack")
conflicts=("anitrack")
source=("anitrack-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/MiguelRegueiro/anitrack-cli/releases/download/v${pkgver}/anitrack-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=("26d794a0e9c158a6f9cb2448112f1e02670ece609a7d211194165601fb7b7494")

package() {
  install -Dm755 "$srcdir/anitrack" "$pkgdir/usr/bin/anitrack"
}


