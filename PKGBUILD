#!/bin/bash
# Maintainer: czjstmax : <jstmaxlol@disroot.org>
pkgname=do
pkgver=latest
pkgrel=1
pkgdesc="doscript is a minimal, hackable and portable scripting language for writing complex interactive build recipes"
arch=('any')
url="https://git.czkove.cc/do"
license=('MIT')
makedepends=('base-devel')
depends=()
source=("git+https://git.czkove.cc/do")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	gcc do.c -o do -O1 -Wall -Wextra -pedantic -std=c11
}

package() {
	install -Dm755 "$srcdir/$pkgname/do" "$pkgdir/usr/bin/$pkgname"
}

