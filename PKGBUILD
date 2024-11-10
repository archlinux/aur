# Maintainer: Watzon <cawatson1993@gmail.com>
pkgname=postpilot-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="PostPilot application"
arch=('x86_64')
url="https://postpilot.watzon.tech"
license=('MIT')
depends=('gtk3' 'webkit2gtk')
provides=('postpilot')
conflicts=('postpilot')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/watzon/postpilot/releases/download/v${pkgver}/postpilot_${pkgver}_linux_amd64.pkg.tar.zst")
#source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/watzon/postpilot/releases/download/v${pkgver}/postpilot_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('SKIP')
#sha256sums_aarch64=('SKIP')

package() {
    # Extract the contents of the .pkg.tar.zst file
    cd "$srcdir"
    cp -r usr/ "$pkgdir/"
}
