# Maintainer: Mauro Andreolini <mauro.andreolini@gmail.com>

pkgname=fortune-mod-cybersuntzu
pkgver=1
pkgrel=1
pkgdesc="#Cyber Sun Tzu fortune cookie file"
arch=('any')
license=('custom:PublicDomain')
url="https://twitter.com/suntzucyber"
depends=('fortune-mod')
groups=('fortune-mods')

source=('cybersuntzu')
sha256sums=('21c1e38e68925ff46214b7d1fbeb2f2b578bc88bdc0c9cd97d29d80a3c45567d')

build() {
	strfile ${srcdir}/cybersuntzu ${srcdir}/cybersuntzu.dat
}

package() {
	  install -D -m644 ${srcdir}/cybersuntzu ${pkgdir}/usr/share/fortune/cybersuntzu
	  install -D -m644 ${srcdir}/cybersuntzu.dat ${pkgdir}/usr/share/fortune/cybersuntzu.dat
}
