# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Whyme Lyu <callme5long@gmail.com>

pkgname=wuzz-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Interactive CLI tool for HTTP inspection"
arch=('x86_64' 'i686' 'arm')
url="https://github.com/asciimoo/wuzz"
license=('AGPL3')
provides=('wuzz')
conflicts=('wuzz')
source_x86_64=("wuzz-$pkgver-x86_64::$url/releases/download/v$pkgver/wuzz_linux_amd64")
source_i686=("wuzz-$pkgver-i686::$url/releases/download/v$pkgver/wuzz_linux_386")
source_arm=("wuzz-$pkgver-arm::$url/releases/download/v$pkgver/wuzz_linux_arm")
sha256sums_x86_64=('359d03a28013ca4636a3d31871ebb30cf303b86b2bf8993b380f7633ec8e5dda')
sha256sums_i686=('849be3c903df37329b266a7109a5a04de4014711dd14cce08a42f135d9bcfebc')
sha256sums_arm=('4e20254791aa7e49bc8f9ea0cc5f67a5e0d0466eaa25aa9a0ecb212a720bc592')

package() {
	install -D "wuzz-$pkgver-$CARCH" "$pkgdir/usr/bin/wuzz"
}
