# Maintainer: Sam Simons <contact at sam-simons dot nl>
# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ebgaramond-otf
_pkgname=EBGaramond12
_commit=f1a739685ce2eb4214eba4b834cbc0fc269d79d5
pkgver=1.0
pkgrel=2
pkgdesc='font (OTF version) by Octavio Pardo & Georg Duffner'
arch=('any')
url='https://github.com/octaviopardo/EBGaramond12'
license=('OFL-1.1')
source=("https://github.com/octaviopardo/$_pkgname/archive/$_commit.zip")
sha256sums=('ec01c92b42b56244188ec790db86c5f952b1f6824b88e5764689e22e44a46d20')

package() {
  cd "$_pkgname-$_commit"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  install -Dm644 fonts/otf/*.otf -t "$pkgdir/usr/share/fonts/$_pkgname-otf/"
}
