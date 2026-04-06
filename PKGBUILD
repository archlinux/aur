# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=spectre-meltdown-checker
pkgver=26.26.0404682
pkgrel=1
pkgdesc="Reptar, Downfall, Zenbleed, ZombieLoad, RIDL, Fallout, Foreshadow, Spectre, Meltdown vulnerability/mitigation checker"
arch=('any')
url="https://github.com/speed47/spectre-meltdown-checker"
license=(GPL-3.0-only)
source=("$pkgname-$pkgver.tar.gz::https://github.com/speed47/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('225537e82f692897526b61212c953b16fc8abef7e092c46796dd64c9566e334b409128986352dea02769c782c913ec39ba87e44c0322f88119958335eaafe383')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 spectre-meltdown-checker.sh "$pkgdir/usr/bin/spectre-meltdown-checker"
}
