# Maintainer: Maxim De Clercq <maximdeclercq00@gmail.com>
pkgname=biber-bin
pkgver=2.18
pkgrel=1
pkgdesc='Biber is a sophisticated bibliography processing backend for the LaTeX biblatex package.'
arch=('i686' 'x86_64')
url='https://ctan.org/pkg/biber'
license=('AST')
depends=('libxcrypt-compat')
provides=("biber=$pkgver")
conflicts=('biber')
source_i686=("http://mirrors.ctan.org/biblio/biber/biber-linux/biber-$pkgver-1-linux_x86_32.tar.gz")
md5sums_i686=('de1703b56240a8b61328d03f27d27623')
source_x86_64=("http://mirrors.ctan.org/biblio/biber/biber-linux/biber-$pkgver-1-linux_x86_64.tar.gz")
md5sums_x86_64=('3f60f479f7f5a854772700142c865d9c')

package() {
    install -Dm755 "biber" "$pkgdir/usr/bin/biber"
}
