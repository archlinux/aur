# Maintainer: Allonsy < linuxbash8 [at@at] gmail [dot.dot] com >
pkgname=git-town
pkgver=7.3.0
pkgrel=1
pkgdesc="A git extension for generic high-level git workflow support"
url="https://github.com/Originate/git-town"
arch=('x86_64')
license=('MIT')
depends=('git')
source=("$pkgname"::"https://github.com/Originate/git-town/releases/download/v$pkgver/git-town-linux-amd64"
        "https://raw.githubusercontent.com/Originate/git-town/master/LICENSE")
sha256sums=('33436f4b81e18cd751dcd5afc4867c245b97aa531cf6f8dd6753e491c4e77f47'
            '83067ad148e1c7c64566986f7717428b3632f1982d0ffb72c4a254be0a521730')

package() {
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 git-town "$pkgdir"/usr/bin
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
