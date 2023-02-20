# Maintainer: pandada8 <pandada8@gmail.com>
pkgname=jsonnet-language-server-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='A Language Server Protocol (LSP) server for Jsonnet'
arch=('x86_64')
url='https://github.com/grafana/jsonnet-language-server'
license=('AGPLv3')
provides=('jsonnet-language-server')
conflicts=('jsonnet-language-server')

source=(
  "${pkgname}-${pkgver}::https://github.com/grafana/jsonnet-language-server/releases/download/v${pkgver}/jsonnet-language-server_${pkgver}_linux_amd64"
)
sha512sums=('d90f791b6226bdeb22de2c9e45e1e1e8713763dd9b4824602c6f85025d3ebe56cf26c34fcb32491925bf9f5cf7c8a0178d1b6aa4fe269d4f114d159dade9f799')

package() {
  install -D "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/jsonnet-language-server"
}
