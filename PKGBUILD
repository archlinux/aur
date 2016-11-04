# Maintainer: Tilman Vatteroth <tilman.vatteroth [at] udo [dot] edu>

pkgname=systemd-soundboardd
pkgver=1.0.0
pkgrel=1
pkgdesc="A socked-based soundboard daemon"
arch=('any')
license=('do what you want')
depends=('systemd' 'mpv' 'bash') 
provides=('systemd-soundboardd')
conflicts=('systemd-soundboardd')
source=("git+https://bitbucket.org/mrdrogdrog/systemd-soundboardd.git")
sha1sums=('SKIP')

package() {
install -Dm644 "${srcdir}/${pkgname}/systemd-soundboardd.service" "${pkgdir}/usr/lib/systemd/system/systemd-soundboardd.service"
install -Dm644 "${srcdir}/${pkgname}/systemd-soundboardd.socket" "${pkgdir}/usr/lib/systemd/system/systemd-soundboardd.socket"
}
