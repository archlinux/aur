# Maintainer: zhullyb <zhullyb@outlook.com>

pkgname=mokee-repo
pkgver=2.11
pkgrel=1
pkgdesc="The Multiple Git Repository Tool from the Android Open Source Project"
url="https://github.com/mokee/git-repo"
arch=('any')
license=("APACHE")
depends=("git" "python")
provides=('repo')
validpgpkeys=('8BB9AD793E8E6153AF0F9A4416530D5E920F5C65'
              '16530D5E920F5C65') # Repo Maintainer <repo@android.kernel.org>
validpgpkeys+=('FD8F1F287C3CE338478E13FBF222F4E62ECD2531'
               'F222F4E62ECD2531') # Martincz Gao <martincz@mokeedev.com>
source=("git+https://github.com/mokee/git-repo")

md5sums=('SKIP')

package() {
  cd git-repo
  install -D -m 755 repo "$pkgdir/usr/bin/repo"
  install -D -m 644 docs/manifest-format.md "$pkgdir/usr/share/doc/$pkgname/manifest-format.md"
} 
