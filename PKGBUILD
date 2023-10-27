# Contributor: Jigsaw <j1g5aw@foxmail.com>
# Contributor: Asuka Minato
# Maintainer: ab5_x <lxl66566@gmail.com>

pkgname=autocorrect-bin
pkgver=2.8.5
pkgrel=1
pkgdesc="A linter and formatter for help you improve copywriting, to correct spaces, punctuations between CJK (Chinese, Japanese, Korean)."
arch=("x86_64" "aarch64")
url="https://github.com/huacnlee/autocorrect"
license=("MIT")
depends=("glibc" "gcc-libs")
provides=("autocorrect")

source_x86_64=("$pkgname-x86_64::https://github.com/huacnlee/autocorrect/releases/download/v$pkgver/autocorrect-linux-amd64.tar.gz")
source_aarch64=("$pkgname-aarch64::https://github.com/huacnlee/autocorrect/releases/download/v$pkgver/autocorrect-linux-arm64.tar.gz")

sha256sums_x86_64=('3feffc994232c1ce02969463e896eb1cd75750920bb02e0331b2c2a8563045f9')
sha256sums_aarch64=('4f2365eb46fb12364356ab8719557f5bc7d78a54af490d6e511f9c4ba522dfd5')

package() {
	install -Dm755 "autocorrect" -t "${pkgdir}/usr/bin/"
}

