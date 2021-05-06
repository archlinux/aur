# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=netrc
pkgver=0.3.1
pkgrel=1
pkgdesc='Utility that allows users to manage netrc files'
arch=('x86_64')
url='https://github.com/dokku/netrc'
license=('MIT')

source=("https://github.com/dokku/netrc/releases/download/v${pkgver}/netrc_${pkgver}_linux_x86_64.tgz"
        'LICENSE')
sha256sums=('f5a362b8b22129847bac47119a4d4282f568b034158a95b3579cc1a3747d257c'
            'e52a4d1021bf3af114fae37e3753d631150603573c7cbd71b35bf9d2f2b26c28')

package() {
  install -Dm 755 netrc "${pkgdir}/usr/bin/netrc"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/netrc/LICENSE"
}
