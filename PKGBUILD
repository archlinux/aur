# Maintainer: Ayatale <ayatale@qq.com>

pkgname=deepl-clipboard
pkgver=0.2.1
pkgrel=1
pkgdesc="Translete text in clipboard to Chinese, based on Deepl."
url="https://github.com/Brx86/deepl-web-api"
arch=("x86_64")
license=("Unlicense")
depends=("python-pyperclip" "zenity")
provides=("deepl-clipboard")
source=("deepl-clipboard")
sha256sums=('73e0b786ce3ef5ad1d9b376ea81952eee53a706023e4567daa3c8d3e7397c599')

package() {
    install -Dm755 "deepl-clipboard" -t "$pkgdir/usr/bin"
}
