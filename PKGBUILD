# Maintainer: Ayatale <ayatale@qq.com>

pkgname=deepl-clipboard
pkgver=0.2.0
pkgrel=1
pkgdesc="Translete text in clipboard to Chinese, based on Deepl."
url="https://github.com/Brx86/deepl-web-api"
arch=("x86_64")
license=("Unlicense")
depends=("python-pyperclip" "zenity")
provides=("deepl-clipboard")
source=("deepl-clipboard")
sha256sums=('a9dd1707d98ee52e58922f393e619619bd8552dcfc762207d588c04ce7d5e280')

package() {
    install -Dm755 "deepl-clipboard" -t "$pkgdir/usr/bin"
}
