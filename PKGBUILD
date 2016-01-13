# Maintainer: frig <m.seliger@posteo.org>

pkgname=dictd-openrc
pkgdesc="Ported gentoo-runscript for dictd under openrc" 
pkgver=1.12.1_5
pkgrel=1
arch=('any')
url="http://www.dict.org"
license=('GPL')
optdepends=('dictd: dict client and server')
install=${pkgname}.install
backup=('etc/openrc/conf.d/dictd'
        'etc/openrc/init.d/dictd')
source=("dictd.confd"
        "dictd.initd")
md5sums=('838887fee38ae4cebd652d399b1f2266'
         'fe144eb98f433589a0a3474110d09d31')

_sysconfdir='etc/openrc'

package() {

 install -Dm755 dictd.confd "$pkgdir/${_sysconfdir}"/conf.d/dictd
 install -Dm755 dictd.initd "$pkgdir/${_sysconfdir}"/init.d/dictd
}
 




