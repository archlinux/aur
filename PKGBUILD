# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=criticality_score-bin
pkgver=2.0.4
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
sha256sums_i686=('bb5579d5d2afb11f96b96310c6b8a72c468d6437a8ca53fe337a9579b5a3f483')
sha256sums_x86_64=('37adf74be2fdb39cf9da7a419dd53e649dfa7e6b41142bc632a688c18716fdb6')
sha256sums_aarch64=('d8a290676929fd8e72025d500457aa1622657651f4dee0e2e9b1854cd3e8e667')


package() {
  install -Dm755 "$srcdir"/{criticality_score,enumerate_github,scorer} -t "$pkgdir/usr/bin"
  install -Dm644 {README,README_criticality_score,README_enumerate_github,README_scorer}.md -t "$pkgdir/usr/share/doc/criticality_score"
}
