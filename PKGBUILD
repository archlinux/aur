# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=akamai-bin
pkgver=1.1.5
pkgrel=1
pkgdesc='Manage and configure Akamai from the Command Line'
arch=('x86_64')
url="https://developer.akamai.com/cli"
license=('Apache2')
provides=('akamai' 'akamai-cli')
source=("https://github.com/akamai/cli/releases/download/${pkgver}/akamai-${pkgver}-linuxamd64")
md5sums=('6053120883211c2c2194f3cf3451993d')

package() {
  cd "${srcdir}"
  install -Dm755 akamai* "${pkgdir}/usr/bin/akamai"
}
# vim:set ts=2 sw=2 et: