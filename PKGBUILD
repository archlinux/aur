pkgname=anitrack-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="CLI/TUI companion for ani-cli with watch-progress tracking (prebuilt binary)"
arch=("x86_64")
url="https://github.com/MiguelRegueiro/anitrack-cli"
license=("GPL-3.0-or-later")
depends=("ani-cli" "glibc" "gcc-libs")
provides=("anitrack")
conflicts=("anitrack")
source=("anitrack-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/MiguelRegueiro/anitrack-cli/releases/download/v${pkgver}/anitrack-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('4a50901c8f7fabe2db9eef181bf39567718a4826f6b5afbcae9129884f4d313a')

package() {
  install -Dm755 "$srcdir/anitrack" "$pkgdir/usr/bin/anitrack"
}


