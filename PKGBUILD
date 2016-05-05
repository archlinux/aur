# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: José Luis Lafuente <jl@lafuente.me>

pkgname=pass-sshaskpass
pkgver=0.0.1
pkgrel=3
pkgdesc='Get ssh passphrase from pass'
url='https://github.com/jlesquembre/pass-sshaskpass'
license=('GPLv2')
arch=('any')
depends=('pass' 'zenity')
source=(git://github.com/jlesquembre/$pkgname.git)
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}/"
  make DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/etc
}