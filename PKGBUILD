# Maintainer: ringo <ringo@deqc.xyz>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Youri Wijnands <arch@iruoy.com>
# Contributor: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.4.4"
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
b2sums=('c632d9520fdbdad7037ae5994cea77de5a63715a5592d403268c6f29e8f3b22334d31e6bd1b93cd3f43fe3c3dcb1c59983c5e51f88a46e670d3cb393de95b9ce')

package() {
  install -Dm755 flyctl -t "$pkgdir/usr/bin/"
  ln -s flyctl "$pkgdir/usr/bin/fly"
}
