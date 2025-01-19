# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor : neroices <me@slce.moe>

pkgname="r-quick-share-bin"
pkgver=0.11.4
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
b2sums=('000091ee5f24a3a6b1fc4277fabfe1fb409b66cda7b4a5e052bf8218fb64fb3b0171c0f22d36b38fad3be103459138e6a7c7457552568052f01170f5b226daf9')

package(){
 bsdtar -xf "data.tar.gz" -C "$pkgdir"
}
