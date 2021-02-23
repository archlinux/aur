# Maintainer: Chinmay Dalal <8aeg3p2h9 at relay dot firefox dot com>

pkgname=fzf-sk-symlink
pkgver=1
pkgrel=1
pkgdesc='Runs sk if fzf is called'
arch=('any')
depends=('skim')
provides=('fzf')
conflicts=('fzf' 'fzf-git')

package() {
  install -dm755 "$pkgdir/usr/bin/"
  cd "$pkgdir/usr/bin/"
  ln -s sk fzf
}
