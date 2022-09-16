# Maintainer: pandada8 <pandada8@gmail.com>
pkgname=jsonnet-language-server-bin
pkgver=0.9.1
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
sha512sums=('9ed99326bc42ab1acb4712c6efba22c80c2f64f80b2996cf5c998652a30e3b98399418f3b5eaa716476c50dccc30fcc3a2778c3bb9b02c0c0a91230761ea0ee6')

package() {
  install -D "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/jsonnet-language-server"
}
