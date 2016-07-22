# Maintainer: Valeriy Huz <ghotrix@gmail.com>
pkgname=bayeselo
pkgver=1
pkgrel=1
pkgdesc="Bayesian Elo Rating Program"
arch=('any')
depends=('gcc-libs-multilib')
url="http://www.remi-coulom.fr/Bayesian-Elo/"
license=('GPL')
source=("http://www.remi-coulom.fr/Bayesian-Elo/bayeselo.tar.bz2")
md5sums=("17ab3271dc707f5f92a2e2fbcb62b1e9")

build() {
    cd "BayesElo"
	make
}

package() {
    cd "BayesElo"
	install -Dm 755 bayeselo $pkgdir/usr/bin/bayeselo
}
