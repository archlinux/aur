# Maintainer: Kuan-Yen Chou <forendef2846 at gmail dot com>

pkgname=yada
pkgver=1.0.0
pkgrel=1
pkgdesc='Yet Another Data Analyzer'
depends=()
arch=('x86_64')
url="https://github.com/kyechou/aur-yada"
license=('MIT')
source=("yada")
sha512sums=('22d42a658cc7aece4f0a4308e17ed68ce5ac2fc58cd91cb5deda54966d15d414a64cd0c9e04000aa369ca9305465298014929b8fa195f4498a2866f1f40b777a')

package() {
    cd "$srcdir"
    install -Dm 755 yada -t "${pkgdir}/usr/bin/"
}

# vim: set ts=4 sw=4 et :
