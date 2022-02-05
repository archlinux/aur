# Maintainer: Jigsaw <j1g5aw@foxmail.com>

pkgname=autocorrect-bin
pkgver=1.5.5
pkgrel=1
pkgdesc="A linter and formatter for help you improve copywriting, to correct spaces, punctuations between CJK (Chinese, Japanese, Korean)."
arch=("x86_64")
url="https://github.com/huacnlee/autocorrect"
license=("MIT")
provides=("autocorrect")

source=("$pkgname::https://github.com/huacnlee/autocorrect/releases/download/v1.5.5/autocorrect-linux-amd64.tar.gz")

sha256sums=('dc930b23bbcf134ba6340d9c49180674ebeee47ec747ebc599bc2bd7dcde6fda')

package() {
    install -Dm755 "autocorrect" "${pkgdir}/usr/bin/autocorrect"
}