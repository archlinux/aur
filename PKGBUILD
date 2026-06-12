# Maintainer: TJ Smith

pkgname='anodizer-bin'
pkgver=0.9.0
pkgrel=1
pkgdesc="A Rust-native release automation tool"
arch=('aarch64' 'x86_64')
url="https://github.com/tj-smith47/anodizer"
license=('MIT')
depends=('glibc')
conflicts=('anodizer')
provides=('anodizer')
source_aarch64=("anodizer-bin_${pkgver}_aarch64.tar.xz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-arm64-extra.tar.xz")
sha256sums_aarch64=('e90634550c4e788da2ded2a066da833ffc3150d15d6a62b2e191fe03da7c53c4')
source_x86_64=("anodizer-bin_${pkgver}_x86_64.tar.xz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-amd64-extra.tar.xz")
sha256sums_x86_64=('5878aabbb8afe92aacaf7efe9840994eb2775a643ec0f9a6ff367ddc63769f93')

package() {
    install -Dm755 "$srcdir/anodizer" "$pkgdir/usr/bin/anodizer"
}
