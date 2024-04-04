# Maintainer : neroices <me@slce.moe>

pkgname=r-quick-share-bin
pkgver=0.5.0
_glibcver=2.31
pkgrel=1
pkgdesc='Rust implementation of NearbyShare/QuickShare from Android for Linux.'
arch=('x86_64')
url='https://github.com/Martichou/rquickshare'
license=('GPL-3.0-or-later')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('r-quick-share')
conflicts=('r-quick-share')
source=("https://github.com/Martichou/rquickshare/releases/download/v${pkgver}/r-quick-share_${pkgver}_amd64_GLIBC-${_glibcver}.deb")
sha256sums=('4d8331d232fef75e51f103c8060279f5e24111c05f4613791a71cb4c128ba142')

package() {
    bsdtar -xf "data.tar.gz" -C "$pkgdir"
}
