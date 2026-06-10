# Maintainer: TJ Smith

pkgname='anodizer-bin'
pkgver=0.7.0
pkgrel=1
pkgdesc="A Rust-native release automation tool"
arch=('aarch64' 'x86_64')
url="https://github.com/tj-smith47/anodizer"
license=('MIT')
depends=('glibc')
conflicts=('anodizer')
provides=('anodizer')
source_aarch64=("anodizer-bin_${pkgver}_aarch64.tar.xz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-arm64-extra.tar.xz")
sha256sums_aarch64=('77230b2549682b51627398556667220cdc7d4209a1e934f2bf40270628a3c5ad')
source_x86_64=("anodizer-bin_${pkgver}_x86_64.tar.xz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-amd64-extra.tar.xz")
sha256sums_x86_64=('83bc3c56bfdf27a38403421c0778422492ab34414681ced67999d0fa9ad1646a')

package() {
    install -Dm755 "$srcdir/anodizer" "$pkgdir/usr/bin/anodizer"
}
