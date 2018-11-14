# Maintainer: Pierre-Yves Ritschard <pyr@spootnik.org>

pkgname=exoscale-cli
pkgver=1.0.4
pkgrel=1
pkgdesc="Command-line tool for everything at Exoscale: compute, storage, dns"
arch=('x86_64')
url="http://exoscale.github.io/cli/"
license=('EPL')
provides=('exoscale-cli')
conflicts=('exoscale-cli')

source=("https://github.com/exoscale/cli/releases/download/v${pkgver}/cli_${pkgver}_linux_amd64.tar.gz")

md5sums=('7d5581b973520048d238fe64efb15b20')

package() {
  install -Dm755 "${srcdir}/exo" "${pkgdir}/usr/bin/exo"
}
