# Maintainer: Jeremy Huang <jeremyhuang55555@gmail.com>
pkgname=jcode-bin
pkgver=0.11.3
pkgrel=1
pkgdesc="AI coding agent powered by Claude and ChatGPT"
arch=('x86_64')
url="https://github.com/1jehuang/jcode"
license=('MIT')
provides=('jcode')
conflicts=('jcode')
source=("https://github.com/1jehuang/jcode/releases/download/v0.11.3/jcode-linux-x86_64.tar.gz")
sha256sums=('329da7e6836d78e4c02ba4ea91ac9642a74f6c2ccd534e252b16454bc3af17d9')

package() {
    install -Dm755 "${srcdir}/jcode-linux-x86_64" "${pkgdir}/usr/bin/jcode"
}
