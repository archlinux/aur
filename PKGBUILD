# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=netrc
pkgver=0.4.1
pkgrel=1
pkgdesc='Utility that allows users to manage netrc files'
arch=('x86_64')
url='https://github.com/dokku/netrc'
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tgz"
        'https://raw.githubusercontent.com/dokku/netrc/master/LICENSE')
sha256sums=('3f01989909e062339bbca816948ca3a7affa6ac622d5656e3293811fceb421ff'
            'e52a4d1021bf3af114fae37e3753d631150603573c7cbd71b35bf9d2f2b26c28')

package() {
  cd "${srcdir}"

  install -Dm755 netrc-amd64 "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
