# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=criticality_score-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="Gives criticality score for an open source project"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/ossf/criticality_score"
license=('Apache-2.0')
provides=("criticality_score=$pkgver")
conflicts=('criticality_score')
source_i686=("https://github.com/ossf/criticality_score/releases/download/v${pkgver}/criticality_score_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://github.com/ossf/criticality_score/releases/download/v${pkgver}/criticality_score_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/ossf/criticality_score/releases/download/v${pkgver}/criticality_score_${pkgver}_linux_arm64.tar.gz")
sha256sums_i686=('96290a27bc76efa8bd029d75e752993157a1e0793ab118222df689702422fe2e')
sha256sums_x86_64=('38014c3271ca2f7d7efc769415ca03a7cf3bc034e48a33b8b447c8269f42eeaa')
sha256sums_aarch64=('29666fe301e54dd0e85a366237f8d030942411e81d988750c427ebe87cd8eff0')


package() {
  install -Dm755 "$srcdir"/{criticality_score,enumerate_github,scorer} -t "$pkgdir/usr/bin"
  install -Dm644 {README,README_criticality_score,README_enumerate_github,README_scorer}.md -t "$pkgdir/usr/share/doc/criticality_score"
}
