# Maintainer: Damir Garifullin <gosugdr@gmail.com>

pkgname=antibody
pkgver=2.2.0
pkgrel=1
pkgdesc="A faster and simpler antigen written in Golang."
arch=('i686' 'x86_64')
url="http://getantibody.github.io/"
license=('MIT')
depends=('zsh')
source_x86_64=("https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_x86_64.tar.gz")
source_i686=("https://github.com/getantibody/antibody/releases/download/v$pkgver/antibody_Linux_i386.tar.gz")
sha256sums_x86_64=('265c73e981031c2cf93d26007dc639a21ba91c0cac66d34430942830f76d4ee2')
sha256sums_i686=('265c73e981031c2cf93d26007dc639a21ba91c0cac66d34430942830f76d4ee2')

package() {
	  cd "$srcdir/"

	  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
