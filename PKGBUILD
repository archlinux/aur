# Maintainer: orphan
# Contributor: Allonsy < linuxbash8 [at@at] gmail [dot.dot] com >
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=git-town-bin
_pkgname=${pkgname%-bin}
pkgver=7.6.0
pkgrel=1
pkgdesc='Generic, high-level Git workflow support'
url="https://github.com/$_pkgname/$_pkgname"
arch=(x86_64)
license=(MIT)
depends=(git)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$url/releases/download/v$pkgver/git-town_${pkgver}_linux_intel_64.tar.gz")
sha256sums=('88b597ab3705d7bf944e58767e7a4d8201a2e73304ecd61944cc03fe1ae32048')

package() {
	install -Dm755 -t "$pkgdir/usr/bin/" "$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
