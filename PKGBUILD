# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: KillaB <xGenoBlast@gmail.com>

pkgname=frozendepths
pkgver=1.06
pkgrel=1
pkgdesc="A roguelike game with a cold theme."
arch=("x86_64")
url="https://frozendepths.net/"
license=("closed")
depends=("ncurses5-compat-libs")
source=("https://frozendepths.net/roguelike/FD106Lin64bitNcursesw.zip"
        "frozendepths")
md5sums=('19235306113d09684e023c3e9f9c696b'
         '44b0e3ab55d1b9e94930870540fcc69c')

package() {
	cd "${srcdir}"
	install -Dm4755 "fdepths" "${pkgdir}/usr/share/frozendepths/fdepths"
	install -m644 *.txt *.fds "${pkgdir}/usr/share/frozendepths"

	install -Dm755 "${srcdir}/frozendepths" "${pkgdir}/usr/bin/frozendepths"
}
