# Maintainer: Borislav Borisov <borislav.borisov@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=osysinfo
pkgver=1.1
pkgrel=1
pkgdesc="A basic CLI tool to see your system details"
arch=('any')
url="https://github.com/ottop/osysinfo"
license=('GPL3')
depends=('python-fire' 'python-distro' 'python-psutil')
source=('https://github.com/ottop/osysinfo/archive/refs/tags/1.1.tar.gz')
sha256sums=('7ebe5f1e90ccc3ede263b2006a229cc3df4e8cee333409f49cbf1affe2f8f6b1')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

