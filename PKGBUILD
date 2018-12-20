# Maintainer: Kloenk <kloenk@kloenk.de>
pkgname=phrased
pkgver=0.2
pkgrel=1
pkgdesc="Generate awesome passphrases from a set of dictionaries."
arch=('x86_64' 'i686')
url="https://phrased.org/"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('phrased')
conflicts=('phrased-git')
replaces=()
backup=()
options=()
source_x86_64=('phrased_x86_64.tar.gz::https://github.com/phrased-org/phrased/releases/download/v0.2/phrased_0.2_Linux-64bit.tar.gz')
source_i686=('phrased_i686.tar.gz::https://github.com/phrased-org/phrased/releases/download/v0.2/phrased_0.2_Linux-32bit.tar.gz')
noextract=()
md5sums_x86_64=('6dc49429aa62c69f37aec01f083e979f')
md5sums_i686=('3f2ab2056938819deca93a7cbc5ecc9a')


package() {
	install -Dm0755 $srcdir/phrased $pkgdir/usr/bin/phrased
	install -Dm0644 $srcdir/README.md $pkgdir/usr/share/doc/$pkgname/README.md
}
