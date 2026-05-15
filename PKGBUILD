# Maintainer: Max Martin <max at maxjmartin dot com>

pkgname=circumflex-bin
pkgver=4.1.1
pkgrel=1
pkgdesc="A command line tool for browsing Hacker News in your terminal. Pre-compiled."
arch=('i686' 'pentium4' 'x86_64' 'aarch64')
url="https://github.com/bensadeh/circumflex"
license=('custom')
depends=('glibc')
provides=('circumflex')
conflicts=('circumflex')
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_386.tar.gz")
source_pentium4=("$pkgname-$pkgver-pentium4.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_386.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_arm64.tar.gz")

sha256sums_i686=('1e20b6c85647635920300b72ad787ca305bcdf9646fb36dd8f5e7eec3951c12b')
sha256sums_pentium4=('1e20b6c85647635920300b72ad787ca305bcdf9646fb36dd8f5e7eec3951c12b')
sha256sums_x86_64=('8e9bf941401dd60a116399d8a1165ba85d57ac2019ddd511e910164020a84d53')
sha256sums_aarch64=('6a16fc36d5d239c599826108c59fbd377094c0ee0efccdd80d4bce262afe35ac')

package() {
    cd "$srcdir"

    install -Dm755 clx "$pkgdir/usr/bin/clx"
    install -Dm644 share/man/clx.1 "$pkgdir/usr/share/man/man1/clx.1"
}
