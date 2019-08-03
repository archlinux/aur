# Maintainer: Lars Rustand <rustand dot lars at gmail dot com>
pkgname=pacman-pkgfile-hook
pkgver=1.0.0
pkgrel=1
pkgdesc='Pacman hook to update the pkgfile database.'
arch=('any')
depends=('pkgfile')
source=('pkgfile.hook')
md5sums=('fb898371b45dbb50e35404ac9be8a43b')

package() {
  install -D -m0644 "${srcdir}/pkgfile.hook" "${pkgdir}/usr/share/libalpm/hooks/pkgfile.hook"
}

