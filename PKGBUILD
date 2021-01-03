# Maintainer: Gasparotto Mattia <gasmat04@gmail.com>

pkgname=terminalizer
pkgver=v0.7.2.r0.gfb079fc
pkgrel=1
pkgdesc="Record your terminal and generate animated gif images or share a web player"
arch=('x86_64')
url="https://terminalizer.com/"
license=('MIT')
depends=('nodejs' 'npm')
makedepends=('git')
source=('git+https://github.com/faressoft/terminalizer')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  npm install -g terminalizer
}