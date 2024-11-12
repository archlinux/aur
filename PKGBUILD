# Maintainer: Watzon <cawatson1993@gmail.com>
pkgname=postpilot-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Email and SMTP testing GUI for developers"
arch=('x86_64' 'aarch64')
url="https://github.com/watzon/postpilot"
license=('MIT')
depends=('gtk3' 'webkit2gtk')
provides=('postpilot')
conflicts=('postpilot')

source_x86_64=("${pkgname}-${pkgver}-x86_64.pkg.tar.zst::https://github.com/watzon/postpilot/releases/download/v${pkgver}/postpilot_${pkgver}_linux_amd64.pkg.tar.zst")
source_aarch64=("${pkgname}-${pkgver}-aarch64.pkg.tar.zst::https://github.com/watzon/postpilot/releases/download/v${pkgver}/postpilot_${pkgver}_linux_arm64.pkg.tar.zst")
sha256sums_x86_64=('4b349e99226d6a041e9f1e797453304a6dea46c6b112921cee1f4d8a973f8a31')
sha256sums_aarch64=('433bc7285cbedabe8a952494cc9b514260d780bdf5f188ba8eae5fa7c7df94fe')

package() {
    cd "$srcdir"
    cp -r usr/ "$pkgdir/"
}
