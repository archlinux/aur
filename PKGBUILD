# Maintainer: Carlo Teubner <carlo@cteubner.net>
pkgname=ath10k-fixer
pkgver=0.1.1
pkgrel=1
pkgdesc="Daemon that monitors the ath10k_pci kernel module and reloads it if needed"
arch=('x86_64')
depends=('gcc-libs' 'glibc')
url="https://github.com/c4rlo/ath10k-fixer"
license=('MIT')
source=("https://github.com/c4rlo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f9d163fa6486561ceb7aaa39d794bb029890f74837ea3a2dbecad325ea39d3ca')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" prefix=/usr install_runner= install
}

# vim:set ts=2 sw=2 et:
