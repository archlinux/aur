# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Allonsy < linuxbash8 [at@at] gmail [dot.dot] com >
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=git-town-bin
pkgver=7.7.0
pkgrel=1
pkgdesc='Generic, high-level Git workflow support'
url='https://github.com/git-town/git-town'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('git')
provides=('git-town')
conflicts=('git-town')
source_x86_64=("$pkgname-$pkgver-x86-64.tar.gz::$url/releases/download/v$pkgver/git-town_${pkgver}_linux_intel_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/git-town_${pkgver}_linux_arm_64.tar.gz")
sha256sums_x86_64=('b7db6aebbb44843295849ca711582cb0c09ec77406238386a41804f6e5eac204')
sha256sums_aarch64=('74f9db81aa5e99296e9c6ae1c46fe2ba7afb4a53f1aa7e9172f5cdbcc7b38756')

package() {
	install -D git-town -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
