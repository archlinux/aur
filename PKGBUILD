# Maintainer : Arman <me@slce.moe>

pkgname=r-quick-share-bin
pkgver=0.4.1
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
sha256sums=('bc0a1ab2922c0fa855b2431b7aa473edf3eda874727ca546e1bb18b31f70161c')

package() {
    bsdtar -xf "data.tar.gz" -C "$pkgdir"
}
