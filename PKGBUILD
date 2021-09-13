# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=nldev-openrc
pkgver=20210913
pkgrel=1
pkgdesc="OpenRC nldev and nltrigger init scripts"
arch=('any')
license=('MIT/X')
depends=('nldev' 'openrc')
source=("nldev.confd"
        "nldev.initd"
        "nltrigger.initd")
sha256sums=('68f14d734172bdb16607a849d2ce8b42828fd2c0ebaf324e8ca05263d5abdf3e'
            '1d80f70281c1c176a5271566b8fba7071cae2ce972cefcf607c457883cd97bc8'
            'e2446bb7592c528fc4b2d695f48ff78213a75b6ed76b78e332ca2f82aae11064')

package() {
    install -Dm755 ${srcdir}/nldev.initd ${pkgdir}/etc/init.d/nldev
    install -Dm755 ${srcdir}/nldev.confd ${pkgdir}/etc/conf.d/nldev
    install -Dm755 ${srcdir}/nltrigger.initd ${pkgdir}/etc/init.d/nltrigger
}
