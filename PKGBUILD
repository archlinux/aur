# $Id$
# Maintainer: Thaodan <theodorstormgrade@gmail.com>
pkgname=zsh-git-prompt
pkgver=0.5
pkgrel=1
pkgdesc="Informative git prompt for zsh"
arch=('any')
url="https://github.com/olivierverdier/zsh-git-prompt"
depends=('zsh' 'python') 
makedepends=('git')
license=('MIT')
source=("https://github.com/olivierverdier/zsh-git-prompt/archive/v$pkgver.tar.gz")
md5sums=('9e445ef5270cfccce2b907fa29c6af0c')


package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm755 gitstatus.py "$pkgdir"/usr/lib/$pkgname/gitstatus.py
  install -Dm755 zshrc.sh "$pkgdir"/usr/lib/$pkgname/zshrc.sh
}
