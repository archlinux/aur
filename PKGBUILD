# Maintainer: ringo <ringo@deqc.xyz>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Youri Wijnands <arch@iruoy.com>
# Contributor: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.4.59"
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
b2sums=('d82799d6ee03d42981076ba2bdb8ce27763a99eb0020f6d12c2147e269f7f654434e38e91b95cf682ecdc42782c0205669f7ff783f47590244aadbf6c34a14bf')

package() {
  install -Dm755 flyctl -t "$pkgdir/usr/bin/"
  ln -s flyctl "$pkgdir/usr/bin/fly"
}
