# Contributor: Jigsaw <j1g5aw@foxmail.com>
# Contributor: Asuka Minato
# Maintainer: ab5_x <lxl66566@gmail.com>

pkgname=autocorrect-bin
pkgver=2.9.1
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
sha256sums_x86_64=('039300a3fd2e91e58c46adb2564775525f4fdfea058efdf5acc9e35ea986085b')
sha256sums_aarch64=('fc06d10218838151829715a638ed6640a432abb481c24d3c0b3630eea15ef96c')

package() {
	install -Dm755 "autocorrect" -t "${pkgdir}/usr/bin/"
	install -Dm644 LIC* -t $pkgdir/usr/share/licenses/$pkgname/
}

