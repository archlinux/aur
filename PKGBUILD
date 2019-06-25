# Maintainer: Bruce Zhang
pkgname=kwin-scripts-window-colors
_reponame=kwinscript-window-colors
_name=lattewindowcolors
pkgver=0.2
pkgrel=1
pkgdesc="KWin script that sends to Latte, window color schemes"
arch=('any')
url="https://github.com/psifidotos/$_reponame"
license=('GPL2')
depends=('kwin')
provides=("$pkgname")
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/psifidotos/$_reponame/archive/v$pkgver.tar.gz")
sha256sums=('76af7dcfb7dda669dff22ccb3c252b4e760caa95c4728cfcc9bfb0bb0e6ceb5c')

package() {
	cd "$_reponame-$pkgver"
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/kwin/scripts/$_name/{}" \;
}
