# Contributor: Jigsaw <j1g5aw@foxmail.com>
# Contributor: Asuka Minato
# Contributor: ab5_x <lxl66566@gmail.com>
# Maintainer: taoky <me@taoky.moe>

pkgname=autocorrect-bin
pkgver=2.12.0
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
sha256sums_x86_64=('f9288d6c5af279a2822d0961ca3a156ea8ede10f9886ad109c12d56a207baf46')
sha256sums_aarch64=('2abc670b709909e5a1811a63997c5bb517d34cb4fe06212db93721dc79280459')

package() {
	install -Dm755 "autocorrect" -t "${pkgdir}/usr/bin/"
	install -Dm644 LIC* -t $pkgdir/usr/share/licenses/$pkgname/
}

