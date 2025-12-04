# Maintainer: ringo <ringo@deqc.xyz>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Youri Wijnands <arch@iruoy.com>
# Contributor: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.3.229"
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
b2sums=('0eb6696f85b9e619b7794d5c482bfb4c660cd3ec447d652569718cea0f7443efbb39b1fb73a876e002645b373f3233e0433494189e79cf5a171166bc702fd352')

package() {
  install -Dm755 flyctl -t "$pkgdir/usr/bin/"
  ln -s flyctl "$pkgdir/usr/bin/fly"
}
