# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=kuttle
pkgver=1.1.1
pkgrel=1
pkgdesc='Kubernetes wrapper for sshuttle'
provides=(kuttle autokuttle)
depends=(sshuttle)
arch=(any)
url='https://github.com/kayrus/kuttle'
license=('GPL2')

source=(kuttle autokuttle)
sha256sums=('2a03b62ca48047046618a72ba49769bbc0c439f5c1efd6dc6feb61b11ebfacab'
            '36a9289695e0470baee2e51448ff8dc55a32e010ebdeb1ac8da03b2cdb3c8ca5')

package() {
    install -Dm755 "${srcdir}/kuttle" "${pkgdir}/usr/bin/kuttle"
    install -Dm755 "${srcdir}/autokuttle" "${pkgdir}/usr/bin/autokuttle"
}
