# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vim-gist
pkgver=7.3
pkgrel=1
pkgdesc="Vim plugin for Gist"
arch=(any)
depends=(vim vim-webapi git)
groups=(vim-plugins)
url="https://github.com/mattn/vim-gist"
license=(custom:vim)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('2678423e9a8df18026f60359128921fbdf03088a26612d0006048f9b46199049')

package() {
  cd vim-gist-$pkgver
  for file in plugin/* autoload/* doc/*
  do
    install -D "$file" "$pkgdir"/usr/share/vim/vimfiles/"$file"
  done
}
