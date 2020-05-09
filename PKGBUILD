# Maintainer: Brandon 'Inco' Little <drinco@posteo.net>
execname=gmod-cef-codec-fix
pkgname="$execname-bin"
projname=GModCEFCodecFix
pkgver=20200108
pkgrel=1
srcdir="$pkgname-$pkgver"
binname="$projname-Linux"
epoch=
pkgdesc="Automatic Patching of GMod CEF for Proprietary Video/Audio Codec Support"
arch=('x86_64')
url="https://github.com/solsticegamestudios"
license=('GPL3')
groups=()
depends=('python3')
makedepends=()
checkdepends=()
optdepends=()
provides=('gmod-cef-codec-fix')
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=("$url/$projname/releases/download/$pkgver/$binname")
noextract=()
md5sums=('8011d0ae7da346636d02a6d38217e570')
validpgpkeys=()

package() {
	mv -v "$binname" "$execname"
	install -d "$pkgdir"/usr/bin/
	install -m755 "$execname" "$pkgdir"/usr/bin/$execname
}
