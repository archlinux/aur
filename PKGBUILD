# Contributor: Jigsaw <j1g5aw@foxmail.com>
# Contributor: Asuka Minato
# Contributor: ab5_x <lxl66566@gmail.com>
# Maintainer: taoky <me@taoky.moe>

pkgname=autocorrect-bin
pkgver=2.14.2
pkgrel=1
pkgdesc="A linter and formatter for help you improve copywriting, to correct spaces, punctuations between CJK (Chinese, Japanese, Korean)."
arch=("x86_64" "aarch64")
url="https://github.com/huacnlee/autocorrect"
license=("MIT")
depends=("glibc" "gcc-libs")
provides=("autocorrect")

source=("https://raw.githubusercontent.com/huacnlee/autocorrect/044425faada4055ebf2629c544c3bc7231330826/LICENSE")
source_x86_64=("$pkgname-x86_64::https://github.com/huacnlee/autocorrect/releases/download/v$pkgver/autocorrect-linux-amd64.tar.gz")
source_aarch64=("$pkgname-aarch64::https://github.com/huacnlee/autocorrect/releases/download/v$pkgver/autocorrect-linux-arm64.tar.gz")

sha256sums=('7015e54d13cf39b8d6ceb60209849c019ed8effc564abb5a77685c75ae76b5be')
sha256sums_x86_64=('ed4c165594bf53f5fbd91b7a6c6e19b8683758ea636f42bfcbb9ad5d20311b8c')
sha256sums_aarch64=('ce7b1829dce56d9800c7412c5f14783a7c4eb0cb6da4e803e37e9c2e890dbb22')

package() {
	install -Dm755 "autocorrect" -t "${pkgdir}/usr/bin/"
	install -Dm644 LIC* -t $pkgdir/usr/share/licenses/$pkgname/
}

