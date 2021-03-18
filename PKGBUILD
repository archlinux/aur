# Maintainer: Gabriel de Oliveira <gabriel.o03@aluno.ifsc.edu.br>
pkgname=zsh-load-nvmrc
pkgver=0.0.1
pkgrel=1
pkgdesc="Automatically handle .nvmrc files"
arch=('any')
url="https://github.com/th3rius/zsh-load-nvmrc"
license=('MIT')
depends=('zsh')
source=("git://github.com/th3rius/${pkgname}/")
sha256sums=('SKIP')

package() {
  cd "$pkgname"
  install -vDm 644 ./load-nvmrc.zsh -t "${pkgdir}/usr/share/zsh/plugins/${pkgname}/"
}
