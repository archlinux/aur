# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=i3-maim
pkgver=2021.04.02
pkgrel=1
pkgdesc="simple screenshot script using maim"
arch=('any')
groups=('therepoclub')
url="https://github.com/The-Repo-Club/i3-maim"
license=('CC BY-NC-SA 4.0')
depends=('libnotify' 'maim' 'xdg-user-dirs' 'xdotool')
optdepends=('xclip: Allow screenshots to be saved to clipboard')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('d6580e29f44c4e688e76de1ff573c97a75380cdcbe0656f22c292e428a8deb4a')

package() {
  mkdir -p $pkgdir/usr
  cp -a $srcdir/$pkgname-$pkgver/usr/bin $pkgdir/usr/bin
}
