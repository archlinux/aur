# Contributor: Nathan Owe. <ndowens04+AUR@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: Mike Sampson <mike@sambodata.com>

pkgname=psgrep
pkgver=1.0.6
pkgrel=2
pkgdesc="Process list search thru grep"
arch=('i686' 'x86_64')
url="https://github.com/jvz/psgrep"
license=('GPL3')
_commit=936fc18be10ebae84eff73c8fb7dc77a93b3d2cf
source=(https://github.com/jvz/${pkgname}/archive/${_commit}.zip)
md5sums=('d2cee26386237dbd8046dbe5599a9f53')

package() {
	cd ${srcdir}/${pkgname}-${_commit}
	install -Dm755 psgrep ${pkgdir}/usr/bin/psgrep
	install -Dm644 psgrep.1 ${pkgdir}/usr/share/man/man1/psgrep.1
}

