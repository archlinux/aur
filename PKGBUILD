# Maintainer : imnyang <me@imnya.ng>

pkgname='dsync'
pkgver=25.10.3
pkgrel=3
pkgdesc='A tool that makes it easy to mirror Linux repositories.'
arch=('x86_64')
url='https://docs.krfoss.org/rokfoss/dsync'
license=('unlicense')
depends=('rsync')

source=("http://download.krfoss.org/dsync")
sha256sums=('010a0802baf4293fca7444b3d9cd59bb8fc5ced1b3e4adc7cd6eea2d79ab5e78')

package() {
    install -Dm755 "${srcdir}/dsync" "${pkgdir}/usr/bin/dsync"
}
