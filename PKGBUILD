# Maintainer: lrustand <rustand dot lars at gmail dot com>
pkgname=pacman-updatedb-hook
pkgver=1.0.0
pkgrel=2
pkgdesc='Pacman hook to update the mlocate database.'
arch=('any')
depends=('mlocate')
source=('updatedb.hook')
md5sums=('843295b2d289a547e466edf06df570d5')

package() {
  install -D -m0644 "${srcdir}/updatedb.hook" "${pkgdir}/usr/share/libalpm/hooks/updatedb.hook"
}

