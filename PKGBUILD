# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=rymfony
pkgname=$_pkgname-bin
pkgver=0.4.6
pkgrel=1
pkgdesc="A command-line tool to mimic the behavior of the Symfony CLI binary (binary release)"
arch=('x86_64')
url="https://github.com/Orbitale/Rymfony"
license=('AGPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$url/releases/download/v$pkgver/rymfony-ubuntu-v$pkgver"
        "$url/raw/main/CHANGELOG.md"
        "$url/raw/main/README.md"
        "$url/raw/main/LICENSE")
sha256sums=('e832ff6a97bf2d0a39086f36d962e10c27db41b12f67ce48b4a2ff6971a9526f'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
  install -Dm644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 rymfony-ubuntu-v$pkgver "$pkgdir/usr/bin/$_pkgname"
}
