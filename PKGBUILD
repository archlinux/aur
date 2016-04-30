pkgname=djgpp-cmake
pkgver=20160430
pkgrel=1
arch=(any)
pkgdesc="CMake wrapper for DJGPP"
depends=(cmake djgpp-pkg-config)
license=("GPL")
url="about:blank"
source=("djgpp-cmake.sh"
"toolchain-djgpp.cmake"
"djgpp-wine.sh")
md5sums=('b910a48fb88cffe6204e5d7c1ec09915'
         'e77375aba6cd293f3f448aea64e6d121'
         '63022e5bea39f3851c994c98f3e472be')

package() {
	install -Dm 644 toolchain-djgpp.cmake "${pkgdir}"/usr/share/djgpp/toolchain-i686-pc-msdosdjgpp.cmake
	install -Dm 755 djgpp-cmake.sh "${pkgdir}"/usr/bin/i686-pc-msdosdjgpp-cmake
	install -m 755 djgpp-wine.sh "${pkgdir}"/usr/bin/i686-pc-msdosdjgpp-wine
}
