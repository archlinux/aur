# Maintainer: Nicholas <allyncat1 at gmail dot com>
pkgname='keepc-bin'
_pkgname=keepc
pkgver=0.1.3
pkgrel=1
pkgdesc="CLI note taking app for commands! Coded in Rust."
arch=('x86_64')
url="https://github.com/nickcat1/keepc"
license=('GPL-3.0')
depends=('glib2' 'glibc' 'gcc-libs')
optdepends=('nano: text editing support')
provides=('keepc')
conflicts=('keepc')
source=("$_pkgname::https://github.com/nickcat1/$_pkgname/releases/download/v$pkgver/$_pkgname")
sha256sums=('da444b263110d9bc9a49a37a1d4f4c8b826b8fd9cd4b77fff3461c894268f530')

package() {
	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
