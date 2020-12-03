# Contributor: Tiberius <tican@protonmail.com>
pkgname=mingw-w64-openimagedenoise-bin
pkgver=1.2.4
pkgrel=1
epoch=
pkgdesc="Interl(R) Open Image Denise library"
arch=("x86_64")
url="https://openimagedenoise.github.io"
license=('Apache')
groups=()
depends=("mingw-w64-crt")
makedepends=()
checkdepends=()
optdepends=("mingw-w64-cmake: cmake support")
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip' '!buildflags' 'staticlibs')
install=
changelog=
source=("https://github.com/OpenImageDenoise/oidn/releases/download/v${pkgver}/oidn-${pkgver}.x64.vc14.windows.zip")
md5sums=('460fbaa8e2cbb4d0cc93ccc4bc25f8d7')

noextract=()
validpgpkeys=()

prepare() {
	cd "oidn-${pkgver}.x64.vc14.windows"
}

build() {
	cd "oidn-${pkgver}.x64.vc14.windows"
}

check() {
	cd "oidn-${pkgver}.x64.vc14.windows"
}

package() {
	cd "oidn-${pkgver}.x64.vc14.windows"
	mkdir -p "$pkgdir/usr/x86_64-w64-mingw32/share"
  cp -r bin "$pkgdir/usr/x86_64-w64-mingw32/bin"
  cp -r lib "$pkgdir/usr/x86_64-w64-mingw32/lib"
  cp -r include "$pkgdir/usr/x86_64-w64-mingw32/include"
  cp -r doc "$pkgdir/usr/x86_64-w64-mingw32/share/"
}
