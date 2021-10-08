# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kuttle
pkgver=1.0.0
pkgrel=2
pkgdesc='Kubernetes wrapper for sshuttle'
provides=(kuttle)
depends=(sshuttle)
arch=(any)
url='https://github.com/kayrus/kuttle'
license=('GPL2')

source=(kuttle)
sha256sums=('fe4e7bd48a56d016d8a7763a09d17ef09966f4b89593e5b66007d440a8668597')

package() {
    install -Dm755 "${srcdir}/kuttle" "${pkgdir}/usr/bin/kuttle"
}
