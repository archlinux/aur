# Maintainer: Kamil Cukrowski <kamilcukrowski@gmail.com>

pkgname=mkinitcpio-archivetmpfs
pkgver=0.0.1
pkgrel=1
pkgdesc="Download, uncompress file or copy directory contents into tmpfs and boot from it."
arch=('any')
license=('MIT')
depends=('mkinitcpio' 'tar')
makedepends=('git')
url="https://github.com/Kamilcuk/mkinitcpio-archivetmpfs"
source=("$pkgname::git://github.com/Kamilcuk/mkinitcpio-archivetmpfs.git")
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname"
	make "DESTDIR=${pkgdir}"
}

