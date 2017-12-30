# Maintainer: Allonsy < linuxbash8 [at@at] gmail [dot.dot] com >
pkgname=git-town
pkgver=5.1.0
pkgrel=1
pkgdesc="A git extension for generic high-level git workflow support"
url="https://github.com/Originate/git-town"
arch=('x86_64')
license=('MIT')
depends=('git')
source=("$pkgname"::"https://github.com/Originate/git-town/releases/download/v5.1.0/git-town-linux-amd64"
        "https://raw.githubusercontent.com/Originate/git-town/master/LICENSE")
md5sums=('20f3e531d165fee0fad214a7bb04868b'
         'SKIP')

package() {
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 git-town "$pkgdir"/usr/bin
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
