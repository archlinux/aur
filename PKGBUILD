# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
pkgname=transcribe
pkgver=8.40
pkgrel=1
pkgdesc="software to help transcribe recorded music"
arch=('i686' 'x86_64')
url="http://www.seventhstring.com/xscribe"
license=('GPL')
groups=()
depends=('gtk2' 'alsa-lib' 'libsm' 'libpng12' 'gstreamer0.10-base')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_i686=(http://www.seventhstring.com/xscribe/downlinux/xscsetup.tar.gz)
source_x86_64=(http://www.seventhstring.com/xscribe/downlinux64/xsc64setup.tar.gz)
noextract=()
md5sums_i686=('06db3475e36287878326d4c7405795a5')
md5sums_x86_64=('5d9d27313b9b4797a85442506c75c116')

package() {
	cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
