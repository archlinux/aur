# Maintainer: ringo <ringo@deqc.xyz>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Youri Wijnands <arch@iruoy.com>
# Contributor: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.4.70"
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
b2sums=('ebeeecdc890675500f451ef5a897c69aa24d181e22b9ae467aeff6b1a094b2548310a52ee1f07db5c5f02eaad8f09142f08a6da4bf6b531310b46cfd743f6810')

package() {
  install -Dm755 flyctl -t "$pkgdir/usr/bin/"
  ln -s flyctl "$pkgdir/usr/bin/fly"
}
