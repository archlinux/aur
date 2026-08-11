# Maintainer: Majorana Oedipus <majoranaoedipus@posteo.net>
# Based on the PKGBUILD of AUR "cppreference"
pkgname=cppreference-zh
pkgver=20260502
pkgrel=1
pkgdesc="zh.cppreference.com 的离线中文文档（HTML）"
arch=('any')
url="http://zh.cppreference.com/"
license=('MIT')
source=("https://github.com/myfreeer/cppreference2mshelp/releases/download/${pkgver:0:4}.${pkgver:4:2}/html-book-${pkgver}.tar.xz")
sha256sums=('8a0810d50fe7f2578dfa25cdf9c31225c4ba7061c18309626b1077fd58625af5')

package() {
    mkdir -p "$pkgdir/usr/share/doc/cppreference-zh"
    mv -t "$pkgdir/usr/share/doc/cppreference-zh/" $srcdir/reference/*
}

