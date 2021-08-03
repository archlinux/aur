# Maintainer: XYenon <i at xyenon dot bid>

pkgname=go-cqhttp-bin

pkgver=v1.0.0_beta5
pkgrel=1

pkgdesc="Lightweight, native cross-platform implementation of cqhttp in Golang."
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://github.com/Mrs4s/go-cqhttp/releases"
license=("AGPL3")

optdepends=("ffmpeg: support voice sending in any format")

source_i686=("${pkgname}-i686-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_386.tar.gz")
source_x86_64=("${pkgname}-x86_64-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_amd64.tar.gz")
source_armv7h=("${pkgname}-armv7h-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_armv7.tar.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_arm64.tar.gz")

sha512sums_i686=('cea13c970c78f238fba7859babe53a6fffc53993114f4aba960d585d44e45d06632dc90505b6fe3d711df6de0c3927c4ca8287ead76cd734c2dc27ff92106902')
sha512sums_x86_64=('7fd43784f51169fc90f2f9100d9ead9d658af7c10266fd4266047a2a71e96cb8d562bd6ab1119a3a89724aa65f46acb5c50e5292fbc8ce316287b95daa29843a')
sha512sums_armv7h=('5c90b74adab7d99dcf0da96ccf3679e025c985bae019dcf8c496f93481d93f476a2fa591ed6dfb6f1db4ee6e68aefa6ad30464d56ab0771242cb261c61ce615e')
sha512sums_aarch64=('2e9cbd8bba371a0620e2343e0dc8fc584dd99d21a58b89a32f40fc9e213a82988e9fce7b1f72e29040613c9b09c38892573085f407fdc33947fbe10fc677472b')

package() {
    cd ${srcdir}
    install -Dm755 "go-cqhttp" "${pkgdir}/usr/bin/go-cqhttp"
}
