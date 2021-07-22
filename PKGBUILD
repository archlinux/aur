# Maintainer: Thomas Eizinger <thomas@eizinger.io>

# All my PKGBUILDs are managed at https://github.com/thomaseizinger/pkgbuilds

_gitname=git-absorb
pkgname=git-absorb-bin
pkgver=0.6.6
pkgrel=0
pkgdesc="git commit --fixup, but automatic"
arch=('x86_64')
provides=("git-absorb")
conflicts=("git-absorb")
url="https://github.com/tummychow/${_gitname}"
license=('BSD-3')
source=("https://github.com/tummychow/git-absorb/releases/download/${pkgver}/git-absorb-linux-x86_64")
sha256sums=('e54bca912c7447c11e346f408e7032d46ed418a7fac62247e63a60254ac71959')

package() {
  cd "$srcdir"

  install -Dm755 git-absorb-linux-x86_64 "$pkgdir/usr/bin/git-absorb"
}
