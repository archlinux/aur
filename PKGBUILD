# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mpathconf
pkgver=0.5.0
pkgrel=1
pkgdesc='mpathconf - A tool for configuring device-mapper-multipath'
arch=('i686' 'x86_64')
url='http://pkgs.fedoraproject.org/cgit/device-mapper-multipath.git/'
license=('GPL2')
depends=('multipath-tools')
source=('mpathconf'
	'mpathconf.8')
sha256sums=('d8a511cf8f75fc09f5e8cfb81d643e840823362356f5e5aee3c62d3a2356905c'
            'e7dc54b1fc1be1ce8cb67947cf5876ec8a2dc79783b10d0c48165931ffa01778')

package() {
	install -D -m0755 "${srcdir}"/mpathconf "${pkgdir}"/usr/bin/mpathconf
	install -D -m0644 "${srcdir}"/mpathconf.8 "${pkgdir}"/usr/share/man/man8/mpathconf.8
}
