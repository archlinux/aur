# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname='git-pair-bin'
pkgver=0.1.0
pkgrel=2
pkgdesc='A simple CLI app to make it easier for pairing for co-authoring commits.'
url='https://github.com/inverse/git-pair/'
arch=('x86_64')
license=('MIT')
provides=('git-pair')
conflicts=('git-pair')
depends=('git')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/inverse/git-pair/releases/download/v0.1.0/git-pair_Linux_x86_64.tar.gz")
sha256sums_x86_64=('67f455e0a013069807e5e600737acfc755b72854402ffdd864482eee578e3577')

package() {
  install -Dm755 "./git-pair" "$pkgdir/usr/bin/git-pair"
  install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/git-pair-bin/LICENSE"
}
