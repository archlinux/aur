pkgname=momlang
pkgver=1.0.0
pkgrel=1
pkgdesc="Momlang programming language"
arch=('x86_64')
url="https://download-pi-ten.vercel.app"
license=('MIT')
depends=('curl')
source=("install.sh::https://download-pi-ten.vercel.app/files/install.sh")
sha256sums=('SKIP')

package() {
  PREFIX="$pkgdir/usr"
  chmod +x install.sh
  ./install.sh
}
