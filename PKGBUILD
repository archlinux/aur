# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor : neroices <me@slce.moe>

pkgname="r-quick-share-bin"
pkgver=0.11.3
_glibcver=2.39
pkgrel=1
pkgdesc="Rust implementation of NearbyShare/QuickShare from Android for Linux."
url="https://github.com/Martichou/rquickshare"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("r-quick-share" "rquickshare")
conflicts=("r-quick-share")
depends=("webkit2gtk" "gtk3" "libayatana-appindicator" "libappindicator-gtk3")
source=("$url/releases/download/v$pkgver/r-quick-share-main_v${pkgver}_glibc-${_glibcver}_amd64.deb")
b2sums=('d55f96cbeeabdeff4274d036ac895508f935625f44358583d927b929bb8ef079112b3efc9723548197287c77b5b490917fcc2e6bed1a1731b28ef0ddaecae834')

package(){
 bsdtar -xf "data.tar.gz" -C "$pkgdir"
}
