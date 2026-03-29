# Maintainer: Jeremy Huang <jeremyhuang55555@gmail.com>
pkgname=jcode-bin
pkgver=0.7.8
pkgrel=1
pkgdesc="AI coding agent powered by Claude and ChatGPT"
arch=('x86_64')
url="https://github.com/1jehuang/jcode"
license=('MIT')
provides=('jcode')
conflicts=('jcode')
source=("https://github.com/1jehuang/jcode/releases/download/v0.7.8/jcode-linux-x86_64.tar.gz")
sha256sums=('2359496f8fcc97a0bd5cf2444339ddba7d8c65549f8e41799f8c6a8ab5a4c4c4')

package() {
    install -Dm755 "${srcdir}/jcode-linux-x86_64" "${pkgdir}/usr/bin/jcode"
}
