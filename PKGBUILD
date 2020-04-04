# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=akamai-bin
pkgver=1.1.5
pkgrel=2
pkgdesc='Manage and configure Akamai from the Command Line'
arch=('x86_64')
url="https://developer.akamai.com/cli"
license=('Apache-2.0')
provides=('akamai' 'akamai-cli')
source=("https://github.com/akamai/cli/releases/download/${pkgver}/akamai-${pkgver}-linuxamd64")
md5sums=('6053120883211c2c2194f3cf3451993d')

package() {
  install -Dm755 "${srcdir}"/akamai* "${pkgdir}/usr/bin/akamai"
}
# vim:set ts=2 sw=2 et: