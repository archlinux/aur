# Maintainer: HMH <henry@freedesk.net>

pkgname=yt
pkgver=1.0
pkgrel=1
pkgdesc="Search and play YouTube videos via command line."
url="https://github.com/H-M-H/yt"
arch=('any')
license=('custom:CC0')
source=("$pkgname-$pkgver::https://raw.githubusercontent.com/H-M-H/yt/v$pkgver/yt")
sha256sums=('3cd01007714ef8b0da95d69098542b37f951c7946a8ef86fd5e3c86de192d65a')

package() {
    install -vDm755 $pkgname-$pkgver "$pkgdir/usr/bin/yt"
}

depends=(jq fzf mpv youtube-dl)
