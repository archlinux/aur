# Maintainer : Arman <me@slce.moe>

pkgname=r-quick-share-bin
pkgver=0.4.0
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
sha256sums=('d28faa0ab457ed716d3578e7d94204e16cc4c0ecc2a950d847d79b2402176599')

package() {
    bsdtar -xf "data.tar.gz" -C "$pkgdir"
}