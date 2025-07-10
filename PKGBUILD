# Maintainer: Energetix/Dark Nebula
# shellcheck disable=SC2034,SC2154
pkgname=localepurge-hook
pkgver=1.0
pkgrel=1
pkgdesc='A hook for run localepurge after each installation or update.'
arch=(any)
depends=(localepurge)
install=.install
options=(!strip !debug)
source=(99-localepurge.hook)
cksums=(SKIP)

package() {
  install -Dm644 "${srcdir}/99-localepurge.hook" "${pkgdir}/usr/share/libalpm/hooks/99-localepurge.hook"
}
