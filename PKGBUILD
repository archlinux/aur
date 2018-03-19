# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=lab
pkgver=0.10.0
pkgrel=1
pkgdesc="A hub-like tool for GitLab."
arch=('x86_64')
url="https://github.com/zaquestion/lab"
license=('custom:Unlicense')
depends=('git')
optdepends=('hub')
source=("https://github.com/zaquestion/lab/releases/download/v${pkgver}/lab_${pkgver}_linux_amd64.tar.gz")

package() {
  cd $srcdir
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 lab $pkgdir/usr/bin/lab
}

sha512sums=('da8c69db41a15c5e95276e0d7a57fd792142aca987ba6c3067eac0727a8cb05721fb0445dcf41fcd7a31616ad100bd624dc8132e7fc19d2f04ce8a18a77318e7')
