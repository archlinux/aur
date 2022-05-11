# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=netrc
pkgver=0.6.0
pkgrel=1
pkgdesc='Utility that allows users to manage netrc files'
arch=('x86_64')
url='https://github.com/dokku/netrc'
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tgz"
        'https://raw.githubusercontent.com/dokku/netrc/master/LICENSE')
sha256sums=('d67e3fdeced7e38949938f9befdd12748c91d7f273ec2c7a8a4223a95277f409'
            'e52a4d1021bf3af114fae37e3753d631150603573c7cbd71b35bf9d2f2b26c28')

package() {
  install -Dm755 netrc-amd64 "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
