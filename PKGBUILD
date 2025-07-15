# Maintainer: AlphaLynx <AlphaLynx at protonmail dot com>

pkgname=pyactivate
pkgver=1.2.0
pkgrel=2
pkgdesc='Add a python venv to your environment from within subdirs in a project'
arch=('any')
url="https://github.com/AlphaLynx0/$pkgname"
license=('MIT')
depends=('bash')
install=instructions.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('19b931862f3d3a8b597655fd2b3a48e07901cd7843a7afceb4c0eeea1309c9b0cb818136f49cec3235b32e07b7647464d5b87090a5b9374c3350ff3ca92b5369')

package() {
    cd $pkgname-$pkgver
    install -Dm644 $pkgname.sh "$pkgdir/usr/share/$pkgname/$pkgname.sh"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
