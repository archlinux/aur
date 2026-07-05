# Maintainer: Evert Vorster <evorster at gmail dot com>
pkgname=pi-ext-mempalace
pkgver=0.1.0
pkgrel=1
pkgdesc='MemPalace durable memory extension for pi coding agent — structured memories, knowledge graph, session hooks, and cross-wing navigation'
arch=('any')
url='https://github.com/evertvorster/pi-ext-mempalace'
license=('MIT')
depends=('pi-coding-agent' 'python-mempalace')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evertvorster/pi-ext-mempalace/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')
install=pi-ext.install

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/mempalace"
  cp -a "${srcdir}/pi-ext-mempalace-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/mempalace/"
  install -Dm644 "${srcdir}/pi-ext-mempalace-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
