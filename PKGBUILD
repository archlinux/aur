# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=plugn
pkgver=0.11.0
pkgrel=1
pkgdesc='Hook system that lets users extend your application with plugins'
arch=('x86_64')
url='https://github.com/dokku/plugn'
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tgz"
        "https://raw.githubusercontent.com/dokku/plugn/master/LICENSE")
sha256sums=('e164b6499c33323586fefeb32e695fde72bcbe51082187988892cb864b75b9ab'
            '53e5aa5031ccdfb11c748e9f626650fca882501618167a690631f76b71c26aaa')

package() {
  install -Dm755 "${pkgname}-amd64" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
