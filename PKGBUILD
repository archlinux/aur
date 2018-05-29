# Maintainer: KopfKrieg <archlinux [at] absolem [dot] cc>

pkgname=pacman-cleanup-hook
pkgver=1.0
pkgrel=2
pkgdesc='Pacman hook to cleanup pacman cache, keeps only the latest cache and the currently installed package. No configuration necessary, just install it.'
arch=('any')
depends=('pacman-contrib')
source=('cleanup.hook')
sha1sums=('8352fc69232b9ae2fea24672c15e103fff80a5d4')

package() {
  mkdir -p "${pkgdir}/etc/pacman.d/hooks"
  cp "${srcdir}/cleanup.hook" "${pkgdir}/etc/pacman.d/hooks/cleanup.hook"
  chmod 0644 "${pkgdir}/etc/pacman.d/hooks/cleanup.hook"
  chown root:root "${pkgdir}/etc/pacman.d/hooks/cleanup.hook"
}
