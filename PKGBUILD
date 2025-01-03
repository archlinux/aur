# Maintainer: Watzon <cawatson1993@gmail.com>
pkgname=postpilot-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Email and SMTP testing GUI for developers"
arch=('x86_64' 'aarch64')
url="https://github.com/watzon/postpilot"
license=('MIT')
depends=('gtk3' 'webkit2gtk')
provides=('postpilot')
conflicts=('postpilot')

source_x86_64=("${pkgname}-${pkgver}-x86_64.pkg.tar.zst::https://github.com/watzon/postpilot/releases/download/v0.1.4/postpilot_${pkgver}_linux_amd64.pkg.tar.zst")
source_aarch64=("${pkgname}-${pkgver}-aarch64.pkg.tar.zst::https://github.com/watzon/postpilot/releases/download/v0.1.4/postpilot_${pkgver}_linux_arm64.pkg.tar.zst")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    cd "$srcdir"
    cp -r usr/ "$pkgdir/"
}
