# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=localxpose-cli
pkgver=latest
pkgrel=1
pkgdesc="A reverse proxy that enables you to expose your localhost to the internet (CLI)"
arch=('x86_64')
url='https://localxpose.io'
license=("custom:${pkgname}")
provides=('localxpose')
depends=('glibc')
source=("${pkgname}-${pkgver}.zip::https://lxpdownloads.sgp1.digitaloceanspaces.com/cli/loclx-linux-amd64.zip"
        'LICENSE')
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 loclx -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}