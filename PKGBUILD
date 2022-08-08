# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Allonsy < linuxbash8 [at@at] gmail [dot.dot] com >
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=git-town-bin
_pkg="${pkgname%-bin}"
pkgver=7.8.0
pkgrel=1
pkgdesc='Generic, high-level Git workflow support'
url='https://github.com/git-town/git-town'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('git')
provides=("$_pkg")
conflicts=("$_pkg")
source_x86_64=("$pkgname-$pkgver-x86-64.tar.gz::$url/releases/download/v$pkgver/${_pkg}_${pkgver}_linux_intel_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${_pkg}_${pkgver}_linux_arm_64.tar.gz")
sha256sums_x86_64=('740c98610e7186afca7d8fa7186342139e653275562ad36e469872d5e76cde41')
sha256sums_aarch64=('72b7dd234c7942c49c0f335d2f7355fc5f5997a8e646f420c2550c762d6292ce')

package() {
	install -D "$_pkg" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
