# Maintainer: Sam Simons <contact at sam-simons dot nl>
# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ebgaramond-otf
_pkgname=EBGaramond12
_commit=8e8d2aff04abb39fceca0b1e8da1f444e466fb3b
pkgver=1.0
pkgrel=1
pkgdesc='font (OTF version) by Octavio Pardo & Georg Duffner'
arch=('any')
url='https://github.com/octaviopardo/EBGaramond12'
license=('OFL')
source=("https://github.com/octaviopardo/$_pkgname/archive/$_commit.zip")
sha256sums=('08c82a332338a474862f7123f0b6c5c7a4256288f890049bcf989d1564c73856')

package() {
  cd "$_pkgname-$_commit"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  install -Dm644 fonts/otf/*.otf -t "$pkgdir/usr/share/fonts/$_pkgname-otf/"
}
