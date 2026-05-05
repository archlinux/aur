# Maintainer: VanHoney <dev@vanhoney.net>
pkgname=rusticize-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="NEMESIS ENGINE Rust Learning Platform — built-in playground, explanations, hints, common mistakes"
arch=('x86_64')
url="https://github.com/VanHoney-ltd/rusticize"
license=('MIT')
provides=('rusticize')
conflicts=('rusticize')
source=("$url/releases/download/v$pkgver/rusticize")
sha256sums=('18a01f8527574f0567cea33667edaf062b80400961c01778e0a84991a3a0b7f7')

package() {
    install -Dm755 rusticize "$pkgdir/usr/bin/rusticize"
}
