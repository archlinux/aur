# Mantainer Julio Gonzalez <juliolokoo at gmail dot com>

pkgname=proot-bin
_pkgname=proot
pkgver=5.1.0
pkgrel=3
pkgdesc="chroot, mount --bind, and binfmt_misc without privilege/setup (bin only)"
arch=('i686' 'x86_64')
url="http://proot.me"
license=('GPL')
provides=('proot')
conflicts=('proot')
depends=('talloc')
source_i686=("${_pkgname}"::'https://github.com/proot-me/proot-static-build/blob/master/static/proot-x86?raw=true')
source_x86_64=("${_pkgname}"::'https://github.com/proot-me/proot-static-build/blob/master/static/proot-x86_64?raw=true')
sha1sums_i686=('6b2f18ff13c1b7f1efe5b55dac0dadaa6966f7a1')
sha1sums_x86_64=('5e713559fd336074971590e8cbe7ab1593ffabfc')

package() {
	install -dm755 "${pkgdir}"/usr/bin
	install -m755 ${srcdir}/${_pkgname} "${pkgdir}"/usr/bin
}

# vim: ft=sh syn=sh et
