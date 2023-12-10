# Maintainer: Valeriy Huz <ghotrix@gmail.com>
pkgname=bayeselo
pkgver=1
pkgrel=2
pkgdesc="Bayesian Elo Rating Program"
arch=('any')
depends=('gcc-libs-multilib')
url="http://www.remi-coulom.fr/Bayesian-Elo/"
license=('GPL')
source=("https://web.archive.org/web/20230314191122/https://www.remi-coulom.fr/Bayesian-Elo/bayeselo.tar.bz2")
md5sums=("2e01d5e3f24f7398c36a0a8e2616667c")

build() {
    cd "BayesElo"
	make
}

package() {
    cd "BayesElo"
	install -Dm 755 bayeselo $pkgdir/usr/bin/bayeselo
}
