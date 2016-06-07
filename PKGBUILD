#!/bin/bash
# shellcheck disable=SC2034
# Maintainer: Alexandre Bouvier <contact at amb dot tf>
_pkgname=foobar2000-playcount
pkgname="$_pkgname-bin"
pkgver=3.0.2
pkgrel=1
pkgdesc="Collects playback statistics for your music"
arch=('any')
url="https://www.foobar2000.org/components/view/foo_playcount"
license=('unknown')
depends=('foobar2000>=1.1.0')
source=("$pkgname-$pkgver.zip::https://www.dropbox.com/s/xhhydw02dbbg7i1/foo_playcount.fb2k-component")
md5sums=('1699e277414cedf2def7df6c3f3f2e54')

package() {
	install -Dm644 -t "${pkgdir:?}/usr/share/foobar2000/components" foo_playcount.dll
}
