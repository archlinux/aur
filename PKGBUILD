# Maintainer: Hauke Rehfeld <aur@haukerehfeld.de>
pkgname=jj-fzf
pkgver=0.24.0  # Update with the actual version
pkgrel=1
pkgdesc=" Text UI for Jujutsu based on fzf, centering around the jj log with key bindings for common operations"
arch=('any')
url="https://github.com/tim-janik/jj-fzf"
license=('MPL')  # Replace with the correct license
depends=('bash' 'shellcheck' 'findutils')  # Add any other necessary dependencies
makedepends=('make' 'grep')  # Add other build-time dependencies
sha256sums=('SKIP')  # Replace with the actual checksum
source=("git+$url.git#tag=v$pkgver")

package() {
  cd "$srcdir/$pkgname"
  # just copy the jj-fzf script to /usr/bin
  install -Dm755 jj-fzf "$pkgdir/usr/bin/jj-fzf"
}
# vim:set ts=2 sw=2 et:
