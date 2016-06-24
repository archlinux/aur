#!/bin/bash
# shellcheck disable=SC2034
# Maintainer: Alexandre Bouvier <contact at amb dot tf>
_pkgname=foobar2000-texttools
pkgname="$_pkgname-bin"
pkgver=1.0.5
pkgrel=1
pkgdesc="Adds customizable context menu commands for copying information about the selected tracks to clipboard"
arch=('any')
url="https://www.foobar2000.org/components/view/foo_texttools"
license=('unknown')
depends=('foobar2000')
source=("$pkgname-$pkgver.zip::https://www.dropbox.com/s/6rzhmgw8y8sibv5/foo_texttools.zip")
md5sums=('29f4b0ded57db27b806b0943ebb239bb')

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir/usr/share/foobar2000/components" foo_texttools.dll
}
