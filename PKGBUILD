# Maintainer: clappski <jake at clapp dot email>

pkgname=mononoki-git
pkgver=1.0
pkgrel=1
pkgdesc="mononoki fonts"
arch=('any')
url="http://github.com/madmalik/mononoki"
license=('OFL')
makedepends=('git')
install=ttf.install
source=("git+https://github.com/madmalik/mononoki.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/mononoki/export/webfont"
  find . -iname '*.ttf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/TTF/{} \;
}
