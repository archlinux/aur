pkgname=gitql-bin
pkgver=2.3.0
pkgrel=1
pkgdesc='A git query language'
arch=('x86_64')
url="https://github.com/filhodanuvem/gitql"
license=('MIT')
provides=('gitql')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/filhodanuvem/gitql/releases/download/v${pkgver}/gitql_${pkgver}_Linux_x86_64.tar.gz"
        'LICENSE::https://github.com/filhodanuvem/gitql/raw/main/LICENSE')
sha256sums=('94372d0cadf412864d2c565d9fba6b1741684f28d36c747d6ac7ce2f0b07e2d2'
            'ca995d876d4738b7f7309c46f443f42bc887db327ed183fe46733a59f06f80b5')

package() {
  install -Dm755 gitql "${pkgdir}/usr/bin/gitql"
  install -Dm755 gitql "${pkgdir}/usr/bin/git-ql"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
