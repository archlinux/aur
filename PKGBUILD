# Maintainer: jetm <floss at jetm.me>

pkgname=gokapi-cli-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Lightweight selfhosted Firefox Send alternative without public upload. AWS S3 supported."
arch=('x86_64')
url="https://github.com/Forceu/Gokapi"
license=('AGPL-3.0')
depends=(
  'pacman>6.1'
  'git'
)
provides=('gokapi')
conflicts=('gokapi')

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname/-bin/}-linux_amd64.zip")
sha256sums_x86_64=('e420a019d12a8ff002a4ae857c1d6e14c9e68cdf199aa44ddf60ffad45a5d1cc')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin/}-linux_amd64" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
