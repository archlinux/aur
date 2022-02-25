pkgname="ihatethedemonkahl"
pkgver="6.6.6"
pkgrel="666"
pkgdesc="I HATE THE DEMON KAHL!"
arch=("x86_64")
license=("MIT")

package() {
	echo 'I HATE THE DEMON KAHL!'
	git clone https://gitdab.com/djsdoodle/IHATETHEDEMONKAHL.git
	mkdir -p ${pkgdir}/usr/bin
	gcc ${srcdir}/IHATETHEDEMONKAHL/src/main.c -o ${pkgdir}/usr/bin/IHATETHEDEMONKAHL
}