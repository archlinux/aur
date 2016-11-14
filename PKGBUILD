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
sha256sums_x86_64=('7a658b685e2546dc51a979add4b4201d2264495f9650c969bf4c3de906806ec6')
sha256sums_i686=('7ab173a6882b90f71e81a93d4ae220c40aa27ca78b96cf63d338fb91648917df')

package() {
	  cd "$srcdir/"

	  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
