# Maintainer: DuckSoft <realducksoft at gmail dot com>

pkgname=tuexdo-cc-wmi-dkms
_pkgname=tuexdo-cc-wmi
pkgdesc='An interface to the WMI methods on TUXEDO laptops'
pkgver=0.1.3
pkgrel=1
arch=('x86_64' 'i686')
url='https://github.com/tuxedocomputers/tuxedo-cc-wmi'
depends=(dkms)
makedepends=(git)
provides=(tuexdo-cc-wmi)
source=("$_pkgname::git+$url")
sha512sums=('SKIP')

package() {
    cd "$srcdir"/$_pkgname
    install -dm755 "$pkgdir"/usr/src/${_pkgname}-${pkgver}
    cp -r "$srcdir"/$_pkgname/* "$pkgdir"/usr/src/${_pkgname}-${pkgver}/
}
