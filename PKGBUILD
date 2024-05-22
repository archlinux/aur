# Contributor: Jigsaw <j1g5aw@foxmail.com>
# Contributor: Asuka Minato
# Contributor: ab5_x <lxl66566@gmail.com>
# Maintainer: taoky <me@taoky.moe>

pkgname=autocorrect-bin
pkgver=2.9.4
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
sha256sums_x86_64=('c4bf7a8af29cee8843b23f9d05456b895782b36bcb0efbe64383ef155d6e71dd')
sha256sums_aarch64=('02ea7373782a4fd10df17bf1b47d05a174c896ddc2d896814ea82ed93e5c0538')

package() {
	install -Dm755 "autocorrect" -t "${pkgdir}/usr/bin/"
	install -Dm644 LIC* -t $pkgdir/usr/share/licenses/$pkgname/
}

