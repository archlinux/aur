# Maintainer: ringo <ringo@deqc.xyz>
# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Youri Wijnands <arch@iruoy.com>
# Contributor: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.3.201"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64")
url='https://github.com/superfly/flyctl'
license=("Apache-2.0")
depends=('glibc')
conflicts=('flyctl')
replaces=('flyctl')
provides=('flyctl')
options=(!strip)
source=("$pkgname-$pkgver-x86_64.tgz::$url/releases/download/v${pkgver}/flyctl_${pkgver}_Linux_x86_64.tar.gz")
b2sums=('dcfbaa2a17c3a7a6a682666bd25a207ea09b4f3c417c3a816b47a39afb2d8ee9db01c64783f18d7d263cf0e9b3bd270f7753aef40ba7af9339576fddeeeb618d')

package() {
  install -Dm755 flyctl -t "$pkgdir/usr/bin/"
  ln -s flyctl "$pkgdir/usr/bin/fly"
}
