# Maintainer: Sam Simons <contact at sam-simons dot nl>
# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ebgaramond-otf
_pkgname=EBGaramond12
_commit=e608414f52e532b68e2182f96b4ce9db35335593
pkgver=1.001
pkgrel=1
pkgdesc='font (OTF version) by Octavio Pardo & Georg Duffner'
arch=('any')
url='https://github.com/octaviopardo/EBGaramond12'
license=('OFL-1.1')
source=("https://github.com/octaviopardo/$_pkgname/archive/$_commit.zip")
sha256sums=('07ec82a5b503922f5d45afbb2ef585059308419a446d5fd79488f964d233c93c')

package() {
  cd "$_pkgname-$_commit"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  install -Dm644 fonts/otf/*.otf -t "$pkgdir/usr/share/fonts/$_pkgname-otf/"
}
