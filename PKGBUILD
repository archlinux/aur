# Maintainer: kbity <bit161660@gmail.com>
pkgname='wbij-bin'
pkgver=0.2.1
pkgrel=1
pkgdesc="a CLI tool for wbijanie zadań"
arch=('x86_64')
url="https://repos.adamm.rocks/maleszka/wbij"
license=('GPL-2.0-or-later')
depends=('fzf')
makedepends=()
conflicts=('wbij')
provides=('wbij')
source=("${pkgname}-${pkgver}::https://repos.adamm.rocks/maleszka/wbij/releases/download/v${pkgver}/wbij")
sha256sums=('018a76f86a779f97fd9be57a36bf8408cd9881034136967d7d2911d45af0fc46')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/wbij"
}
# vim: ft=bash
