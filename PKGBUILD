pkgname=anitrack-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="CLI/TUI companion for ani-cli with watch-progress tracking (prebuilt binary)"
arch=("x86_64")
url="https://github.com/MiguelRegueiro/anitrack-cli"
license=("GPL-3.0-or-later")
depends=("ani-cli" "glibc" "gcc-libs")
provides=("anitrack")
conflicts=("anitrack")
source=("anitrack-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/MiguelRegueiro/anitrack-cli/releases/download/v${pkgver}/anitrack-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=("e99e5194ed23287bf363fd6f46fa40dedd02f620629af68fd6438e7d51a18673")

package() {
  install -Dm755 "$srcdir/anitrack" "$pkgdir/usr/bin/anitrack"
}


