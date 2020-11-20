# Maintainer: Tang Yuming <felinae225@qq.com>
pkgname=clashup
pkgver=0.2.6
pkgrel=1
pkgdesc="auto update clash's config file"
license=('GPL')
arch=('any')
url="https://github.com/felinae98/clashup"
depends=(python
         clash
         python-requests
         python-daemon)
source=(clashup clashup.conf)
package() {
    install -Dm755 clashup ${pkgdir}/usr/bin/clashup
    install -Dm644 clashup.conf ${pkgdir}/etc/systemd/user/clash.service.d/clashup.conf
}
md5sums=('5003219768c527792b83b9412097c4c5'
         '177338346005e11d33e27edc1f8ab780')
