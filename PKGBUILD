# Maintainer: Christopher Michael Mescher $(echo \<pascha-mescher+faith\>|sed s/\+/./g\;s/\-/@/)

pkgname=pascha-cli-bin
pkgver=2.0
pkgrel=1

pkgdesc="A simple CLI program to calculate and display the date of Pascha (Easter)"
arch=('any')
url="https://gitlab.com/cmmescher/pascha-cli.git"
license=('GPL3')
depends=()
makedepends=()
provides=("${pkgname%-cli-bin}")
conflicts=("${pkgname%-cli-bin}")
source=("https://github.com/cmmescher/pascha-cli/releases/download/v2.0/pascha-v2-0.gz"
  "https://gitlab.com/cmmescher/pascha-cli/-/archive/v2.0/pascha-cli-v2.0.tar.gz")
md5sums=('751b4c3d0e0a9058b4245508a1577dde'
         'f4c0abe4ae1eb6d78ce1a86987088b8b')
sha256sums=('8a4399511c9312e9deab69ac2b5103c1b1cfbb841340f4988caa1ad5c1f43790'
            '7691728028210be4115d1faffbf7a1c70d3e289967f7e0e963b4171388c6ce40')

package() {
    install -Dm0755 "$srcdir/pascha-v2-0" "$pkgdir/usr/bin/pascha"
    install -Dm0644 -t "$pkgdir/usr/share/man/man1" "$srcdir/pascha-cli-v2.0/pascha.1.gz"
}
