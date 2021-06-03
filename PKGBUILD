pkgname=gitql-bin
pkgver=2.2.0
pkgrel=1
pkgdesc='A git query language'
arch=('x86_64')
url="https://github.com/filhodanuvem/gitql"
license=('MIT')
provides=('gitql')
depends=('glibc')
source=("${pkgname}-${pkgver}.zip::https://github.com/filhodanuvem/gitql/releases/download/${pkgver}/gitql-linux64.zip"
        'LICENSE::https://github.com/filhodanuvem/gitql/raw/main/LICENSE')
sha256sums=('18a73ed06cbac727de7ab4f4ec18bd4f2046b297a06122aac46692e43e3a343a'
            'ca995d876d4738b7f7309c46f443f42bc887db327ed183fe46733a59f06f80b5')

package() {
  install -Dm755 gitql "${pkgdir}/usr/bin/gitql"
  install -Dm755 gitql "${pkgdir}/usr/bin/git-ql"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
