# Maintainer: malevolent <docampo.angel@gmail.com>
pkgname=juju-bin
pkgver=4.0.11
pkgrel=1
pkgdesc="Juju — open source application modelling tool by Canonical (binary release)"
arch=('x86_64' 'aarch64')
url="https://juju.is"
license=('LGPL-3.0-only')
provides=('juju')
conflicts=('juju' 'juju-bin')
source_x86_64=("${pkgname}-${pkgver}-linux-amd64.tar.xz::https://github.com/juju/juju/releases/download/v${pkgver}/juju-${pkgver}-linux-amd64.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-linux-arm64.tar.xz::https://github.com/juju/juju/releases/download/v${pkgver}/juju-${pkgver}-linux-arm64.tar.xz")
sha256sums_x86_64=('4fdd505173376fa48e6a6fda84c2763a2923cc50c0ebaec609251f6964c99ffc')
sha256sums_aarch64=('874cae059c6166831205716e1744c7d43a9fa5da24daa8db8117dcdb88ba0192')

package() {
    cd "${srcdir}"
    install -Dm755 juju          "${pkgdir}/usr/bin/juju"
    install -Dm755 juju-metadata "${pkgdir}/usr/bin/juju-metadata"
}
