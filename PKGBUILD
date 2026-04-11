# Maintainer: Jeremy Huang <jeremyhuang55555@gmail.com>
pkgname=jcode-bin
pkgver=0.9.8
pkgrel=1
pkgdesc="AI coding agent powered by Claude and ChatGPT"
arch=('x86_64')
url="https://github.com/1jehuang/jcode"
license=('MIT')
provides=('jcode')
conflicts=('jcode')
source=("https://github.com/1jehuang/jcode/releases/download/v0.9.8/jcode-linux-x86_64.tar.gz")
sha256sums=('2ac3c2f201ff4de10d32565dd2d057ec924d9f9d3a7bd8e3fdb60a139221b7a4')

package() {
    install -Dm755 "${srcdir}/jcode-linux-x86_64" "${pkgdir}/usr/bin/jcode"
}
