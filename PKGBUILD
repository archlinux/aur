# Maintainer: TheSerphh <souravgope765@gmail.com>
pkgname=serphhenv
pkgver=2.0.0
pkgrel=1
pkgdesc="A powerful dialog-based TUI for managing Python virtualenvs"
arch=('any')
url="https://github.com/theserphh/serphhenv"
license=('MIT')
depends=('bash' 'python' 'dialog')
install='serphhenv.install'
source=("serphhenv")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/serphhenv" "${pkgdir}/usr/bin/serphhenv"
}
