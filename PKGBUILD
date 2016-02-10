# Mantainer Julio Gonzalez <juliolokoo at gmail dot com>

pkgname=proot-bin
_pkgname=proot
pkgver=5.1.0
pkgrel=1
pkgdesc="chroot, mount --bind, and binfmt_misc without privilege/setup (bin only)"
arch=('i686' 'x86_64')
url="http://proot.me"
license=('GPL')
provides=('proot')
conflicts=('proot')
depends=('talloc')
[ "$CARCH" = "i686" ] && source=("${_pkgname}"::'http://portable.proot.me/proot-x86_64')
[ "$CARCH" = "x86_64" ] && source=("${_pkgname}"::'http://portable.proot.me/proot-x86_64')
[ "$CARCH" = "i686" ] && sha1sums=('6b2f18ff13c1b7f1efe5b55dac0dadaa6966f7a1')
[ "$CARCH" = "x86_64" ] && sha1sums=('5e713559fd336074971590e8cbe7ab1593ffabfc')

package() {
	install -dm755 "${pkgdir}"/usr/bin
	install -m755 ${srcdir}/${_pkgname} "${pkgdir}"/usr/bin
}

# vim: ft=sh syn=sh et
