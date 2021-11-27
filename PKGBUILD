# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: KopfKrieg <archlinux [at] absolem [dot] cc>

pkgname=pacman-cleanup-hook
pkgver=1.1
pkgrel=1
pkgdesc='hook to cleanup pacman cache keeping only the installed plus next most recent packages'
arch=(any)
depends=(pacman-contrib)
source=(pacman-cache-cleanup.hook)
sha256sums=('6b37d7694deeebe1c6a865ed635b96dd1c0b1b8eb486b5c87a92bb3009e43654')

package() {
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" ${source[0]}
}
