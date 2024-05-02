# Maintainer : neroices <me@slce.moe>

pkgname=r-quick-share-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='Rust implementation of NearbyShare/QuickShare from Android for Linux.'
arch=('x86_64')
url='https://github.com/Martichou/rquickshare'
license=('GPL-3.0-or-later')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('r-quick-share')
conflicts=('r-quick-share')
source=("https://github.com/Martichou/rquickshare/releases/download/v${pkgver}/r-quick-share_${pkgver}_amd64.deb")
sha256sums=('9c9f026e52eb0ba9b37ce170907284bb4902a56940ce1d10551160916a97744d')

package() {
    bsdtar -xf "data.tar.gz" -C "$pkgdir"
}
