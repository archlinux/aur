# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor : neroices <me@slce.moe>

pkgname="r-quick-share-bin"
pkgver=0.11.5
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
b2sums=('02ca5f543d94b3a1bf529387813bbb66b713478258a8edbf53e7561fc2739d6e62228e30d5373963f696065dab4cb0218a30f2c61d2533dc712b410d21f1f98d')

package(){
 bsdtar -xf "data.tar.gz" -C "$pkgdir"
}
