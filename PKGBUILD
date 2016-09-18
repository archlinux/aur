pkgname=vim-bracketed-paste
pkgver=1.1
pkgrel=1
pkgdesc="enable transparent pasting into vim"
arch=('any')
url="https://github.com/ConradIrwin/$pkgname"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
source=("$url/archive/master.zip")
sha256sums=('d0e493e3e62221227960cc7eb1a483c3234245089210fd8afa2ef93b0702ef10')

package() {
    cd "$pkgname"-master
    install -Dm755 plugin/bracketed-paste.vim -t "$pkgdir"/usr/share/vim/vimfiles
}
