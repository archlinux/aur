# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=spectre-meltdown-checker
pkgver=0.44
pkgrel=1
epoch=
pkgdesc="Spectre, Meltdown, Foreshadow, Fallout, RIDL, ZombieLoad vulnerability/mitigation checker"
arch=('any')
url="https://github.com/speed47/spectre-meltdown-checker"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/speed47/spectre-meltdown-checker/archive/v$pkgver.tar.gz")

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 spectre-meltdown-checker.sh "$pkgdir/usr/bin/spectre-meltdown-checker"
}

sha256sums=('96765d765275476c36a146da123fa7e9eb310a84e84ae71b179c9ace3b6ab0c8')
