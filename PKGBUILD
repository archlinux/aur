# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=plugn
pkgver=0.12.0
pkgrel=1
pkgdesc='Hook system that lets users extend your application with plugins'
arch=('x86_64')
url='https://github.com/dokku/plugn'
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tgz"
        "https://raw.githubusercontent.com/dokku/plugn/master/LICENSE")
sha256sums=('2697716e6eb187e7d2ec61bf10effed1385c47f25d95c4bbb46b5b89c38a6a76'
            '53e5aa5031ccdfb11c748e9f626650fca882501618167a690631f76b71c26aaa')

package() {
  install -Dm755 "${pkgname}-amd64" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
