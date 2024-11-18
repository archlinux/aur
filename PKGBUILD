# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor : neroices <me@slce.moe>

pkgname="r-quick-share-bin"
pkgver=0.11.2
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
b2sums=('0e7942bfa03c8fa44be7d2abd94359131f36b4b8ac9c00eb1cafd31c2ec685d94fc461cff41e9e6218b43ba428c8b0470c7b5fd1b33d42ab0dce79c8173d323f')

package(){
 bsdtar -xf "data.tar.gz" -C "$pkgdir"
}
