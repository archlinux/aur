# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=netrc
pkgver=0.4.0
pkgrel=2
pkgdesc='Utility that allows users to manage netrc files'
arch=('x86_64')
url='https://github.com/dokku/netrc'
license=('MIT')

source=("https://github.com/dokku/netrc/releases/download/v${pkgver}/netrc_${pkgver}_linux_amd64.tgz"
        'LICENSE')
sha256sums=('e261de50729885665435d02174bebab9d69458b3799c545ae8fcea9093541171'
            'e52a4d1021bf3af114fae37e3753d631150603573c7cbd71b35bf9d2f2b26c28')

package() {
  install -Dm 755 netrc-amd64 "${pkgdir}/usr/bin/netrc"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/netrc/LICENSE"
}
