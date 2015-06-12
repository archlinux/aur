# Contributor: Pierre Chapuis <catwell@archlinux.us>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=xspin
pkgver=5.2.5
pkgrel=1
pkgdesc="Tcl/Tk GUI for spin"
arch=('any')
url="http://spinroot.com/"
license=('custom')
depends=('spin' 'tk')
source=(http://spinroot.com/spin/Src/xspin525.tcl)

build() {
  sed -i 's~#!/bin/sh~#!/usr/bin/wish -f~' xspin525.tcl
  install -Dm0755 xspin525.tcl  $pkgdir/usr/bin/xspin
  install -Dm0644 /usr/share/licenses/spin/LICENSE.txt \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}

md5sums=('4b41ff53c1834168aa183def9036bbb7')
