# Maintainer: Anna Ivanova <kalterfx@gmail.com>

pkgname=terminus-re33
pkgver=1.0
pkgrel=1
pkgdesc="ttf version of terminus-font"

arch=(any)
depends=(fontconfig xorg-font-utils)

_source_url='https://deadsoftware.ru/files/kalterfx/aur.archlinux.org/packages/terminus-re33'

source=("$_source_url/terminus-re33.ttf.gz")
sha512sums=("$(curl "$_source_url/terminus-re33.ttf.gz.sha512sum.gz" | gzip -d)")

package() {
	install -Dm644 "$srcdir/${pkgname}.ttf" \
	               "$pkgdir/usr/share/fonts/TTF/${pkgname}.ttf"
}

