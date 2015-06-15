# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
pkgname=pwnypack
pkgver=0.6.0
pkgrel=1
pkgdesc="Official Certified Edible Dinosaurs CTF toolkit"
arch=('any')
url="https://github.com/edibledinos/pwnypack"
license=('MIT')
depends=(
	'nasm'
	'python'
	'python-capstone'
	'python-nose'
	'python-six'
)
makedepends=('python')
optdepends=(
	'ipython: interactive pwnypack repl (shell)'
)
options=(!emptydirs)
install=
source=(https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=(a5d58847eaa35dc6d13e0fa7f444a2ce)
sha1sums=(d51ae658ec2b192af5b33bf0376ae891fae0fbbd)
sha256sums=(fc129e22a078e68bbe96d1afe62d5aa497a75d69eae2c54fb90d2cd4364dc155)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
