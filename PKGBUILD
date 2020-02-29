# Maintainer: Radosław Rowicki radrowicki at gmail dot guessit
# Contributor: Radosław Rowicki radrowicki at gmail dot guessit

pkgname=i3hloc
_pkgname=i3hloc
pkgver=1.0.1
pkgrel=1
pkgdesc="Flexible scheduler for i3bar. Precompiled binary version"
arch=('x86_64')
url="https://github.com/radrow/i3hloc"
license=('BSD3')
provides=('i3hloc')
conflicts=('i3hloc-git')
depends=('i3-wm')
source=("https://github.com/radrow/i3hloc/releases/download/1.0.1/i3hloc")
sha256sums=('d08f854be4e64221193f6dff2ba3dece1cc370e3193ae001bb627597de807daf')

package() {
	install -Dm755 i3hloc ${pkgdir}/usr/bin/i3hloc
}
