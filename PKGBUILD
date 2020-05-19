# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=nba-go-bin
pkgver=0.4.0
pkgrel=2
pkgdesc='The finest NBA CLI'
arch=('x86_64')
url="https://github.com/xxhomey19/nba-go"
license=('MIT')
provides=('nba-go')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/nba-go-linux"
        'LICENSE::https://github.com/homerchen19/nba-go/raw/master/LICENSE')
sha256sums=('3af7c395f71ec53bd2e83e5f5714e766e4233b729de6691244e6aed33f21cf97'
            'e0623932c9ad8cbd098e978e989988d86d27670c433f8956091e8c409f175ae7')

package() {
  install -Dm755 "${srcdir}"/nba* "${pkgdir}/usr/bin/nba-go"
  install -Dm655 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et: