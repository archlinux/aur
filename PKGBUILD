# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=lab
pkgver=0.10.1
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

sha512sums=('cc37579364b1a0308427dc925d3d9b2d05d1f6448f5282b0894fa487a7e46c9839860b5ecf515ae93bed3bbaa575009411b09c7c0067fbc2eb66c69cef3429d2')
