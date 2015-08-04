# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='xfluxd'
pkgver='1.0.0'
pkgrel='4'
pkgdesc="Daemon functionality for command-line version of x.flux for X"
url='https://justgetflux.com/'
arch=('any')
license=('GPL3')
depends=('xflux')
source=('xfluxd.conf' 'xfluxd.service')
install='xfluxd.install'
backup=('etc/xfluxd.conf')
sha256sums=(
    'f1bdad2c0300dd1ab6b409420e2b2e291d6bc6fd73219f5131959caed639e350'
    '64cbd0280b17eaa797fe349e7969073f49a9cf4682aac127abb7bcc135d720a4'
)

package() {
    install -Dm644 ${srcdir}/xfluxd.conf ${pkgdir}/etc/xfluxd.conf
    install -Dm644 ${srcdir}/xfluxd.service ${pkgdir}/usr/lib/systemd/user/xfluxd.service
}
