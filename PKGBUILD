# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: José Luis Lafuente <jl@lafuente.me>

pkgname=pass-sshaskpass
pkgver=0.0.1
pkgrel=2
pkgdesc='Get ssh passphrase from pass'
url='https://github.com/jlesquembre/pass-sshaskpass'
license=('GPLv2')
arch=('any')
depends=('pass' 'zenity')
provides=('x11-ssh-askpass')
conflicts=('x11-ssh-askpass')
#source=("http://git.zx2c4.com/password-store/snapshot/password-store-${pkgver}.tar.xz")
#md5sums=('ca094372e1eec8c857b2f6ace09fb723')

source=(git://github.com/jlesquembre/$pkgname.git)
md5sums=('SKIP')

package() {
  #cd "${srcdir}/${pkgname}-${pkgver}/"
  cd "${srcdir}/${pkgname}/"
  make DESTDIR="${pkgdir}" install
}