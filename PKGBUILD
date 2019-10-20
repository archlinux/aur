# Maintainer: Cobalt Space <cobaltspace at protonmail dot com>
pkgname=blobsaver
pkgver=2.4.0
pkgrel=2
epoch=
pkgdesc="A cross-platform GUI app for saving SHSH blobs using s0uthwest's fork of tsschecker"
arch=('any')
url="https://github.com/airsquared/blobsaver"
license=('GPL3')
groups=()
depends=('java-runtime=8' 'java8-openjfx' 'archlinux-java-run')
makedepends=()
checkdepends=()
optdepends=('libimobiledevice: get plugged in device information')
provides=()
conflicts=('blobsaver-git')
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/releases/download/v$pkgver/$pkgname-linux.tar.gz" "$pkgname.sh" "$pkgname.desktop")
noextract=()
md5sums=('b944c7f36d774d8d777f439e5a2e72c1'
         'cf64cc261dd259213bf37c311edbe71f'
         'b47041056203fd1f9e2cf507cff14eec')
validpgpkeys=()

package() {

	install -Dm755 "$srcdir/$pkgname.jar" "$pkgdir/usr/share/$pkgname/$pkgname.jar"
	install -Dm755 "$srcdir/tsschecker" "$pkgdir/usr/share/$pkgname/tsschecker"
	install -Dm775 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
