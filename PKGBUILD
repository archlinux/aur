# Maintainer: Shane Forster <me@shaneforster.ca>
# Contributer: Jeremy Wakeman <jeremywakeman@gmail.com>
# Contributer: Chris Höppner <me@mkaito.com>
pkgname=dasht
pkgver=2.4.0
pkgrel=1
pkgdesc="API documentation in your terminal"
arch=(any)
url="https://github.com/sunaku/dasht"
license=('ISC')
depends=('bash' 'sqlite' 'wget' 'socat' 'w3m')
makedepends=('git')
conflicts=('dasht-git')
source=("https://github.com/sunaku/dasht/archive/v$pkgver.tar.gz")
sha1sums=('4fae3d656f47d11a3d7d970a9ebc48a0e9cd54e6')

package() {
  cd "$srcdir/$pkgname-$pkgver/bin"
  install -Dm755 -t $pkgdir/usr/bin *
  cd "$srcdir/$pkgname-$pkgver/man/man1"
  install -Dm755 -t $pkgdir/usr/share/man/man1 *
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# sh-indentation: 2
# End:
