# Maintainer: Alexey Manukhin <axxapy@gmail.com>

pkgname=xfs_undelete
pkgdesc='An undelete tool for the XFS filesystem by Jan Kandziora <jjj@gmx.de>'
pkgver=git
pkgrel=1

arch=('any')
license=('GPLv3')
url=https://github.com/ianka/xfs_undelete

source=("git+https://github.com/ianka/xfs_undelete.git")
md5sums=('SKIP')
depends=('tcl' 'tcllib')

package() {
	install -D -m 755 "${srcdir}/xfs_undelete/xfs_undelete" "${pkgdir}/usr/bin/xfs_undelete"
	install -D -m 644 "${srcdir}/xfs_undelete/xfs_undelete.man" "${pkgdir}/usr/share/man/man1/xfs_undelete.1"
}

