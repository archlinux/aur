# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='xfluxd'
pkgver='1.0.0'
pkgrel='3'
pkgdesc="Daemon functionality for command-line version of x.flux for X"
url='https://justgetflux.com/'
arch=('any')
license=('GPL3')
depends=('xflux')
source=('xfluxd.conf' 'xfluxd.service')
install='xfluxd.install'
backup=('etc/xfluxd.conf')
sha512sums=(
    'f1bdad2c0300dd1ab6b409420e2b2e291d6bc6fd73219f5131959caed639e350'
    'a0a2d0b789e5ca746ce2147a2ffff78844e092eb139cb003c3a5725acd918a40'
)

package() {
    install -Dm644 ${srcdir}/xfluxd.conf ${pkgdir}/etc/xfluxd.conf
    install -Dm644 ${srcdir}/xfluxd.service ${pkgdir}/usr/lib/systemd/user/xfluxd.service
}
