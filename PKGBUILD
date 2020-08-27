# Maintainer: timescam <rex.ky.ng at gmail dot com>
# Contributor: holouden <holouden @t tutanota d.o.t. com>

pkgname=ttf-hack-ligatured
pkgver=v3.003+Nv2.1.0+FC3.1+JBMv2.001
pkgrel=2
pkgdesc="Latest ligatures with Hack font built with fully automated CI/CD by gaplo917"
arch=("any")
url="https://github.com/gaplo917/Ligatured-Hack"
license=("GPL3")
provides=("ttf-hack")
replaces=("ttf-ligatured-hack")
source=("https://github.com/gaplo917/Ligatured-Hack/releases/download/${pkgver}/HackLigatured-${pkgver}.zip"
        "${pkgver}-LICENSE::https://raw.githubusercontent.com/gaplo917/Ligatured-Hack/master/LICENSE")
sha256sums=("82ffde5a31acf4ec36dd783e84cf36e1faceb7ab13a9ac119531106ebf1fab6b"
            "8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903")

package() {
	mkdir -p ${pkgdir}/usr/share/fonts/TTF/${_pkgname}
	install -m644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/${_pkgname}
	install -Dm644 ./${pkgver}-LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/${pkgver}-LICENSE
}

