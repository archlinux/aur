# Maintainer: Carlo Teubner <carlo@cteubner.net>
pkgname=ath10k-fixer
pkgver=0.1.3
pkgrel=1
pkgdesc="Daemon that monitors the ath10k_pci kernel module and reloads it if needed"
arch=('x86_64')
depends=('gcc-libs' 'glibc')
url="https://github.com/c4rlo/ath10k-fixer"
license=('MIT')
source=("https://github.com/c4rlo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('12350df2a0c6d431f44fc0833fe5b1d4d3e5ad492827b700450c039e1a2e4015')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" prefix=/usr install_runner= install
}

# vim:set ts=2 sw=2 et:
