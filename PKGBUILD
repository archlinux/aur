# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=nldev-openrc
pkgver=20210603
pkgrel=1
pkgdesc="OpenRC nldev and nltrigger init scripts"
arch=('any')
license=('MIT/X')
depends=('nldev' 'openrc')
source=("nldev.confd"
        "nldev.initd"
        "nltrigger.initd")
sha256sums=('72523eebefc050df76a82698bf56901c46df98bb554d016ebabb805ab10c6d7e'
            '262238f02af571db99e18663414d4d3450609f1b35a85722d9bae08f0e84a16a'
            '766bb955aad9289b87eccb5ab1c4f82815288ac209c0a7454374fdcda547d088')

package() {
    install -Dm755 ${srcdir}/nldev.initd ${pkgdir}/etc/init.d/nldev
    install -Dm755 ${srcdir}/nldev.confd ${pkgdir}/etc/conf.d/nldev
    install -Dm755 ${srcdir}/nltrigger.initd ${pkgdir}/etc/init.d/nltrigger
}
