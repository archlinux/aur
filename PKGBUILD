# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kuttle
pkgver=1.0.0
pkgrel=1
pkgdesc='Kubernetes wrapper for sshuttle'
provides=(kuttle)
depends=(sshuttle)
arch=(any)
url='https://github.com/kayrus/kuttle'
license=('GPL2')

package() {
    install -Dm755 "${srcdir}/kuttle" "${pkgdir}/usr/bin/kuttle"
}
