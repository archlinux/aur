# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=epiphany-sync
pkgver=1
pkgrel=1
pkgdesc="Load whole profile in memory (synced to tmpfs)"
arch=(any)
license=(GPL)
depends=(bash systemd)
source=(epiphany-sync{,.service})
sha1sums=('2a8fda153bf3fb2d9a14b632082329ed6e2d8fab'
          '2c1c89aee5e1ea2ca47d518690b93238213e73fd')
package() {
  install -Dm 755 {"${srcdir}","${pkgdir}"/usr/bin}/epiphany-sync
  install -Dm 644 {"${srcdir}","${pkgdir}"/usr/lib/systemd/user}/epiphany-sync.service
}
