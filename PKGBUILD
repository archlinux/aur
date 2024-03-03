# Maintainer : Arman <me@slce.moe>

pkgname=r-quick-share-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Rust implementation of NearbyShare/QuickShare from Android for Linux.'
arch=('x86_64')
url='https://github.com/Martichou/rquickshare'
license=('AGPL-3.0')
depends=('webkit2gtk-4.1')
provides=('r-quick-share')
source=("https://github.com/Martichou/rquickshare/releases/download/v${pkgver}/r-quick-share_${pkgver}_amd64.deb")
sha256sums=('652077a763418b5facd397afa4639d39039d95dcadd57bc58eaacdfd8943e6c6')

package() {
    bsdtar -xf "data.tar.gz" -C "${pkgdir}/"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/"
}