pkgname=anitrack-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="CLI/TUI companion for ani-cli with watch-progress tracking (prebuilt binary)"
arch=("x86_64")
url="https://github.com/MiguelRegueiro/anitrack-cli"
license=("GPL-3.0-or-later")
depends=("ani-cli" "glibc" "gcc-libs")
provides=("anitrack")
conflicts=("anitrack")
source=("anitrack-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/MiguelRegueiro/anitrack-cli/releases/download/v${pkgver}/anitrack-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=("9910c91dbb6fac0f6d6bc23c3a5a93eae2a82b47e5741ffdad6f3354ade1952d")

package() {
  install -Dm755 "$srcdir/anitrack" "$pkgdir/usr/bin/anitrack"
}


