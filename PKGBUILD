# Maintainer: Quint Guvernator <quint@guvernator.net>

pkgname=gg
pkgver=0.2.0
pkgrel=1

pkgdesc='Shuts down the system in anger.'
url='https://github.com/qguv/gg'
arch=('any')
license=('Apache')

depends=('bash')
source=("https://github.com/qguv/gg/archive/v$pkgver.tar.gz")
sha256sums=('5ab51b7eeea5f1830cc95e24817df111cc10c6fa5e764ff0a4fce8c0bec0eb25')

package() {
	cd gg-"$pkgver"
	install -Dm755 gg "$pkgdir"/usr/bin/gg
}
