pkgname=davesync
pkgver=0.1.3
pkgrel=1
pkgdesc='Synchonizes and encrypts a local directory with a remote WebDAV folder'
arch=('any')
url=https://github.com/Junker/davesync
license=('GPL3')
depends=('python-webdav4' 'python-colorlog' 'python-gnupg')
source=("https://github.com/Junker/$pkgname/archive/refs/tags/$pkgver.zip")
sha256sums=('dc0749e5f5cac5be03477b928f01fdf557be802fae16a1cae7b3659c01a639a8')

package() {
    mkdir -p "${pkgdir}/usr/bin"
	install -Dm755 $srcdir/$pkgname-$pkgver/$pkgname.py $pkgdir/usr/bin/$pkgname
}
