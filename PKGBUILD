# Maintainer: VanHoney <dev@vanhoney.net>
pkgname=rusticize-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="NEMESIS ENGINE Rust Learning Platform — built-in playground, explanations, hints, common mistakes"
arch=('x86_64')
url="https://github.com/VanHoney-ltd/rusticize"
license=('MIT')
provides=('rusticize')
conflicts=('rusticize')
source=("$url/releases/download/v$pkgver/rusticize-$pkgver-linux-amd64.tar.gz")
sha256sums=('07f728af261164c8efd749ef2b3e649767ee20ee8c1cf51ab2499c350f358947')

package() {
    install -Dm755 rusticize "$pkgdir/usr/bin/rusticize"
    install -Dm755 rusticize-launcher "$pkgdir/usr/bin/rusticize-launcher"
    install -Dm644 rusticize.desktop "$pkgdir/usr/share/applications/rusticize.desktop"
    install -Dm644 rusticize.png "$pkgdir/usr/share/pixmaps/rusticize.png"
}
