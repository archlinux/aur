# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=ms-edit
pkgname="$_pkgbase-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple editor for simple needs (Microsoft Edit)"
arch=('x86_64' 'aarch64')
url="https://github.com/microsoft/edit"
license=('MIT')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase-$pkgver.xz::https://github.com/microsoft/edit/releases/download/v$pkgver/edit-$pkgver-$arch-linux-gnu.xz")
sha256sums=('bdab6db16b167b38ef318e7972a10072d562c4ca2dba26ea7ea33cf1a106a6fa')

package() {
	install -Dm755 "$_pkgbase-$pkgver" "$pkgdir/usr/bin/ms-edit"
}
