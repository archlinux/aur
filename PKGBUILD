# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=usql-bin
pkgver=0.7.8
pkgrel=1
pkgdesc="Universal command-line interface for SQL databases"
arch=('x86_64')
url='https://github.com/xo/usql'
license=('MIT')
options=('!strip')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.bz2::${url}/releases/download/v${pkgver}/usql-${pkgver}-linux-amd64.tar.bz2"
        'LICENSE::https://github.com/xo/usql/raw/master/LICENSE')
sha256sums=('406538408da22a01eb56644447bb781c509dd634c7f89d5f428df22289243946'
            '1aae8f533b6341e4dd3c891cce64a321ec21f6ed1216c963eb9b6669f3c906bf')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}