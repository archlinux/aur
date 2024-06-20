# Maintainer : neroices <me@slce.moe>

pkgname=r-quick-share-bin
pkgver=0.8.2
pkgrel=1
pkgdesc='Rust implementation of NearbyShare/QuickShare from Android for Linux.'
arch=('x86_64')
url='https://github.com/Martichou/rquickshare'
license=('GPL-3.0-or-later')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('r-quick-share')
conflicts=('r-quick-share')
source=("https://github.com/Martichou/rquickshare/releases/download/v${pkgver}/r-quick-share_${pkgver}_amd64.deb")
sha256sums=('061c8369fcac4dca58e8732a07525d90eb99bd4c75e669fb90434de34cab102d')

package() {
    bsdtar -xf "data.tar.gz" -C "$pkgdir"
}
