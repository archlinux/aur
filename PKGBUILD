# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=wm-maim
pkgver=2021.04.12
pkgrel=1
pkgdesc="simple screenshot script using maim"
arch=('any')
groups=('therepoclub')
url="https://github.com/The-Repo-Club/$pkgname"
license=('CC BY-NC-SA 4.0')
depends=('libnotify' 'maim' 'xdg-user-dirs' 'xdotool')
optdepends=('xclip: Allow screenshots to be saved to clipboard')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('cbd1f18975dd8ee065c1dd56ad6d681b051ed3e5704eef87a8d36a84328842b9')

package() {
  mkdir -p $pkgdir/usr
  cp -a $srcdir/$pkgname-$pkgver/usr/bin $pkgdir/usr/bin
}
