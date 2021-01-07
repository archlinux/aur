# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: KopfKrieg <archlinux [at] absolem [dot] cc>

pkgname=pacman-cleanup-hook
pkgver=1.0
pkgrel=8
pkgdesc='hook to cleanup pacman cache keeping only the installed version plus most recent cache'
arch=('any')
depends=('pacman-contrib')
source=('cleanup.hook')
sha256sums=('235d6743e8d91bec5ab911a12e061be417f2d179edbc8423fe628fdbfec6876a')

package() {
  install -D -m0644 "${srcdir}/cleanup.hook" "${pkgdir}/usr/share/libalpm/hooks/cleanup.hook"
}
