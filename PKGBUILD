pkgname=anitrack-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="CLI/TUI companion for ani-cli with watch-progress tracking (prebuilt binary)"
arch=("x86_64")
url="https://github.com/MiguelRegueiro/anitrack-cli"
license=("GPL-3.0-or-later")
depends=("ani-cli" "glibc" "gcc-libs")
provides=("anitrack")
conflicts=("anitrack")
source=("anitrack-linux-x86_64.tar.gz::https://github.com/MiguelRegueiro/anitrack-cli/releases/download/v${pkgver}/anitrack-linux-x86_64.tar.gz")
sha256sums=("6d46a110a6e1674bcbaf096d233987b8f7efd4946419b62aca204a4f21eb5bc0")

package() {
  install -Dm755 "$srcdir/anitrack" "$pkgdir/usr/bin/anitrack"
}


