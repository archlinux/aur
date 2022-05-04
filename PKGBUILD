# Mantainer Julio Gonzalez <juliolokoo at gmail dot com>

pkgname=proot-bin
_pkgname=proot
pkgver=5.3.1
pkgrel=1
pkgdesc="chroot, mount --bind, and binfmt_misc without privilege/setup (bin only)"
arch=('i686' 'x86_64')
url="https://proot-me.github.io/"
license=('GPL')
provides=('proot')
conflicts=('proot')
depends=('talloc')
source_x86_64=("${_pkgname}"::'https://proot.gitlab.io/proot/bin/proot')
sha1sums_x86_64=('aa10c69e4c03240c5fcbc18f8a646a14090c6f73')

package() {
	install -dm755 "${pkgdir}"/usr/bin
	install -m755 ${srcdir}/${_pkgname} "${pkgdir}"/usr/bin
}

# vim: ft=sh syn=sh et
