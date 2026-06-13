# Maintainer: TJ Smith

pkgname='anodizer-bin'
pkgver=0.9.1
pkgrel=1
pkgdesc="A Rust-native release automation tool"
arch=('aarch64' 'x86_64')
url="https://github.com/tj-smith47/anodizer"
license=('MIT')
depends=('glibc')
conflicts=('anodizer')
provides=('anodizer')
source_aarch64=("anodizer-bin_${pkgver}_aarch64.tar.xz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-arm64-extra.tar.xz")
sha256sums_aarch64=('1df77cfd4644cbae616ddba878ae6a11db2b9a7ee2430e175d780be4eced35bd')
source_x86_64=("anodizer-bin_${pkgver}_x86_64.tar.xz::https://github.com/tj-smith47/anodizer/releases/download/v${pkgver}/anodizer-${pkgver}-linux-amd64-extra.tar.xz")
sha256sums_x86_64=('a380dfafb53b7190fa60e22a93a9da38368166c818b9ca4fd3048dcbed9f34fa')

package() {
    install -Dm755 "$srcdir/anodizer" "$pkgdir/usr/bin/anodizer"
}
