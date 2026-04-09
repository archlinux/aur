# Maintainer: Jeremy Huang <jeremyhuang55555@gmail.com>
pkgname=jcode-bin
pkgver=0.9.7
pkgrel=1
pkgdesc="AI coding agent powered by Claude and ChatGPT"
arch=('x86_64')
url="https://github.com/1jehuang/jcode"
license=('MIT')
provides=('jcode')
conflicts=('jcode')
source=("https://github.com/1jehuang/jcode/releases/download/v0.9.7/jcode-linux-x86_64.tar.gz")
sha256sums=('06175d21d7350ceb7630722d25da34a81a96274662144f6e5c691be6504277bf')

package() {
    install -Dm755 "${srcdir}/jcode-linux-x86_64" "${pkgdir}/usr/bin/jcode"
}
