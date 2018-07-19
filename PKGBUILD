# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=lab-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="A hub-like tool for GitLab (pre-built binary release)"
arch=('x86_64')
url="https://github.com/zaquestion/lab"
license=('custom:Unlicense')
depends=('git')
optdepends=('hub')
makedepends=('go')
conflicts=("${pkgname%-bin}-git" "${pkgname%-bin}")
source=("https://github.com/zaquestion/${pkgname%-bin}/releases/download/v${pkgver}/lab_${pkgver}_linux_amd64.tar.gz")
sha512sums=('b96911c4653d213f5a1dfb6e70a106ac219d44506be3fcdb6661bcfa7cc30d471b9b768222855647c282c165f1ee8688523ab12406edaff692fa4c316a9ee575')

package() {
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE
    install -Dm755 lab $pkgdir/usr/bin/lab
}
