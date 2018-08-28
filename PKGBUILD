# Maintainer: Daniel Lima <danielmariodelima@gmail.com>
pkgname='pacman-bashisms-hook'
pkgver=0.0.1
pkgrel=1
license=('GPL3')
pkgdesc='Adjust bashisms in shell scripts.'
url='https://github.com/limadm/pacman-bashisms-hook'
arch=('any')
depends=('checkbashisms')
source=("${pkgname}::git+${url}#tag=${pkgver}")
md5sums=('SKIP')

package () {
	cd "${pkgname}"
	install -Dm755 replace-bashisms \
		"${pkgdir}/usr/bin/replace-bashisms"
	install -Dm644 replace-bashisms.hook \
		"${pkgdir}/usr/share/libalpm/hooks/replace-bashisms.hook"
}
