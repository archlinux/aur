# Maintainer: Damir Garifullin <gosugdr@gmail.com>

pkgname=antibody
pkgver=2.2.4
pkgrel=1
pkgdesc="A faster and simpler antigen written in Golang."
arch=('i686' 'x86_64')
url="http://getantibody.github.io/"
license=('MIT')
depends=('zsh')
source_x86_64=("https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_x86_64.tar.gz")
source_i686=("https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_i386.tar.gz")
sha256sums_x86_64=('a1be31effcfbab17601d90f5bd155ba94d577b87a2420b84b9dceaa10acb688b')
sha256sums_i686=('e5663e35b7ab83f56c24cbc0cc279e5bec1768f340086384c233b3136c29857b')

package() {
	  cd "$srcdir/"

	  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
