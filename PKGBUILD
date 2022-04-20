# Maintainer: Ayatale <ayatale@qq.com>

pkgname=deepl-clipboard
pkgver=0.1.0
pkgrel=1
pkgdesc="Translete text in clipboard to Chinese, based on Deepl Translate API."
url="https://github.com/zu1k/deepl-api-rs"
arch=("x86_64")
license=("Unlicense")
depends=("deepl-api-rs" "python-pyperclip" "zenity")
provides=("deepl-clipboard")
install="service.install"
source=("deepl-clipboard")
sha256sums=('42c6e1efd0b54b9e4974c193948b02c713c0af44d9283ae5f86901cd80a78dde')

package() {
    install -Dm755 "deepl-clipboard" -t "$pkgdir/usr/bin"
}
