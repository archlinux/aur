# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Youri Wijnands <arch@iruoy.com>
# Contributor: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="flyctl-bin"
pkgver="0.3.107"
pkgrel="1"
pkgdesc="Command line tools for fly.io services"
arch=("x86_64" 'aarch64')
url='https://github.com/superfly/flyctl'
license=("Apache-2.0")
depends=('glibc')
provides=("flyctl")
conflicts=("flyctl")
source_x86_64=("$pkgname-$pkgver-x86_64.tgz::$url/releases/download/v${pkgver}/flyctl_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tgz::$url/releases/download/v${pkgver}/flyctl_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('0e5ac592f23e97a67ebc7759f1cb4d35cb006e6d8770d7816c21eb583976dc31')
sha256sums_aarch64=('a1f15775ea4ae2298ba6e2ba62a154bb1f8b01e7eb4404aa88aeafe6fa816b09')

package() {
	install -Dm755 flyctl -t "$pkgdir/usr/bin/"
	ln -s flyctl "$pkgdir/usr/bin/fly"
}
