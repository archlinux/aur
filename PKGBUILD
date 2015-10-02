# Maintainer: Richard Neumann aka. rne <r dor neumann at homeinfo fullstop de>

pkgname='xorg-server-systemd'
pkgver='1.0.0'
pkgrel=1
pkgdesc='Systemd template to start an X server on the respective display'
arch=('any')
license=('GPL3')
depends=('xorg-server' 'systemd')
makedepends=('git')
source=("${pkgname}::git+https://github.com/HOMEINFO/${pkgname}")
md5sums=('SKIP')
pkgdir='pkg'
srcdir='src'


package() {
    install -d -m 755 ${pkgdir}/usr/lib/systemd/system
    install -m 644 ${srcdir}/X@.service ${pkgdir}/usr/lib/systemd/system/
}
