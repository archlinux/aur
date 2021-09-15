# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=auth-thu-bin
pkgver=2.2
pkgrel=1
provides=('auth-thu')
conflicts=('auth-thu')
pkgdesc='A commandline Tunet (auth4/6.tsinghua.edu.cn, Tsinghua-IPv4) authentication tool'
arch=('x86_64')
url='https://github.com/z4yx/GoAuthing'
license=('GPL3')
source=("$pkgname-$pkgver::https://github.com/z4yx/GoAuthing/releases/download/v$pkgver/auth-thu.linux.x86_64")
sha256sums=('24718658254c5c88da21b1e156c3b9d58a635690bc68ffef9b9e446bffc97a93')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/auth-thu"
}
