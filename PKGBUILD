# Maintainer: zhullyb <zhullyb@outlook.com>

pkgname=mokee-repo
pkgver=2.12.2
pkgrel=1
pkgdesc="The Multiple Git Repository Tool from the Android Open Source Project"
url="https://github.com/mokee/git-repo"
arch=('any')
license=("APACHE")
depends=("git" "python")
provides=('repo')
conflicts=('repo')
source=("https://github.com/MoKee/git-repo/archive/v$pkgver.tar.gz")

md5sums=('SKIP')

package() {
  cd $srcdir/git-repo-$pkgver
  install -D -m 755 repo "$pkgdir/usr/bin/repo"
  install -D -m 644 docs/manifest-format.md "$pkgdir/usr/share/doc/$pkgname/manifest-format.md"
} 
