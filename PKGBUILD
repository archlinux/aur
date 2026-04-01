# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=spectre-meltdown-checker
pkgver=26.21.0401891
pkgrel=1
pkgdesc="Reptar, Downfall, Zenbleed, ZombieLoad, RIDL, Fallout, Foreshadow, Spectre, Meltdown vulnerability/mitigation checker"
arch=('any')
url="https://github.com/speed47/spectre-meltdown-checker"
license=(GPL-3.0-only)
source=("$pkgname-$pkgver.tar.gz::https://github.com/speed47/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('f7222690b7d1a58bfd0938d4780c1fe0788f763ac27e4873a275298a1a85254cc2db14e4826d18cc8c9040554aa48ced6304ad6215e96c62396bb0d28272bc60')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 spectre-meltdown-checker.sh "$pkgdir/usr/bin/spectre-meltdown-checker"
}
