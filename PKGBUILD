pkgname=skim-symlinks
pkgver=1
pkgrel=1
pkgdesc='Runs skim if fzf is called'
arch=('any')
depends=('skim')
provides=('fzf')
conflicts=('fzf')

package() {
  install -dm755 "$pkgdir/usr/bin"
  ln -s sk "$pkgdir/usr/bin/fzf"
}
