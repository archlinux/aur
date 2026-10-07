# Maintainer: Energetix/Dark Nebula
# shellcheck disable=SC2034,SC2154
pkgname=localepurge-hook
pkgver=1.0
pkgrel=1
pkgdesc='A hook for run localepurge after each installation or update.'
arch=(any)
url='https://aur.archlinux.org/packages/localepurge'
license=(0BSD)
depends=(localepurge)
install=.install
options=(!strip !debug)
source=(99-localepurge.hook)
sha256sums=('9a4d313e360e9030ad28581c2a399687ac1238faff5dc65e915668354e9d4980')

package() {
  install -Dm644 "${srcdir}/99-localepurge.hook" "${pkgdir}/usr/share/libalpm/hooks/99-localepurge.hook"
}
