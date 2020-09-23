# Maintainer: Allonsy < linuxbash8 [at@at] gmail [dot.dot] com >
pkgname=git-town
pkgver=7.4.0
pkgrel=1
pkgdesc="Generic, high-level Git workflow support!"
url="https://github.com/git-town/git-town"
arch=('x86_64')
license=('MIT')
depends=('git')
source=("${pkgname}.tar.gz"::"https://github.com/git-town/git-town/releases/download/v$pkgver/git-town_${pkgver}_linux_intel_64.tar.gz")
sha256sums=('80ae7fd645be59d60689b117bde1ab363f18be2329ae92688d4b0297e272ce06')

package() {
  tar xf ${pkgname}.tar.gz
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 git-town "$pkgdir"/usr/bin
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
