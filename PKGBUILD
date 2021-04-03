# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=i3-maim
pkgver=2021.04.03
pkgrel=1
pkgdesc="simple screenshot script using maim"
arch=('any')
groups=('therepoclub')
url="https://github.com/The-Repo-Club/i3-maim"
license=('CC BY-NC-SA 4.0')
depends=('libnotify' 'maim' 'xdg-user-dirs' 'xdotool')
optdepends=('xclip: Allow screenshots to be saved to clipboard')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('dbf5cb4908c17ecaf242e3646ebb20e1393666460e756fe19583d596c9b862ca')

package() {
  mkdir -p $pkgdir/usr
  cp -a $srcdir/$pkgname-$pkgver/usr/bin $pkgdir/usr/bin
}
