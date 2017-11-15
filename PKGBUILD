# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

pkgname='lab'
pkgver='0.5.2'
pkgrel=1
pkgdesc="A hub-like tool for GitLab."
arch=('x86_64')
url="https://github.com/zaquestion/lab"
license=('custom:Unlicense')
depends=('git')
optdepends=('hub')
source=("https://github.com/zaquestion/lab/releases/download/v${pkgver}/lab_${pkgver}_linux_amd64.tar.gz")
sha512sums=('35161114e7890bed191b053fc7daebcb0d5e6f574c636dcd23a1c4a2bc62b86c93fca7dd449f7fecc69536628b10810b630c02364f8238bca1074bf14a2b7192')

package() {
  cd $srcdir
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 lab $pkgdir/usr/bin/lab
}
