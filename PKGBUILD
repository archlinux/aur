# Maintainer: Woody_1997 <jdj.harwood@protonmil.ch>
# Contributor: Clayton Craft <clayton@craftyguy.net>
pkgname=fmo
pkgver=2.0
pkgrel=2
pkgdesc="A tool for locating installed AUR orphans."
arch=('i686' 'x86_64')
url="https://gitlab.com/craftyguy/fmo"
license=('GPL3')
depends=('auracle' 'python3')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://gitlab.com/craftyguy/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('c080bbc78821beb3b106b6cae6200cef91183807a61f696cd460dc62fc44601355a114735d5b3e3b684a70e99b0027f06700d2d3e7f33d7515cf3d742248a09a')

package() {
	install -m755 -D "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}



