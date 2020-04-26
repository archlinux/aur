# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: José Luis Lafuente <jl@lafuente.me>

pkgname=pass-sshaskpass
pkgver=0.0.1
pkgrel=3
pkgdesc='Get ssh passphrase from pass'
url='https://github.com/jlesquembre/pass-sshaskpass'
license=('GPLv2')
arch=('any')
depends=('pass' 'zenity')
makedepends=('git')
source=("git://github.com/jlesquembre/${pkgname}.git")
b2sums=('SKIP')

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/etc
}
