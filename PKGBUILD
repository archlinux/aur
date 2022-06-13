# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='pul'
pkgver=0.6.0
pkgrel=1
pkgdesc='Static utilities library for the average C project'
arch=('x86_64' 'armv7a')
makedepends=('fasm')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('b18e536180819bed393d65256c7fe0df3b886635aa1d91e6ce661c50b4f1aa7b')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

