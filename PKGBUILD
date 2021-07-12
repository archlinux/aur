# Maintainer Chris Werner Rau <aur@cwrau.io>

_binname=kubectl-node_shell
pkgname=${_binname/_/-}
pkgver=1.5.1
pkgrel=0
pkgdesc="Exec into node via kubectl"
url="https://github.com/kvaps/$pkgname"
license=('APACHE')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('05d4efb03253bd1a0be460c0b33a3f8ed25316e7434ff89013a2a2d2803bdbc1fe58c4eba2a34da932c099902edae7d27dc23125348b773f67476222866efadb')

package() {
  install -D -m 0755 $srcdir/$pkgname-$pkgver/$_binname $pkgdir/usr/bin/$_binname
}

#vim: syntax=sh

