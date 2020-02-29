# Maintainer: KopfKrieg <archlinux [at] absolem [dot] cc>

pkgname=pacman-arch-audit-hook
pkgver=1.0
pkgrel=1
pkgdesc='Pacman hook to output arch-audit after each pacman operation. No configuration necessary, just install it.'
arch=('any')
depends=('arch-audit')
source=('arch-audit.hook')
sha256sums=('468be36ee35a7ae116612fc748d656f3139a75c92cb5ac96581b9c2f21f95e53')

package() {
  install -D -m0644 "${srcdir}/arch-audit.hook" "${pkgdir}/usr/share/libalpm/hooks/arch-audit.hook"
}

