# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux AT free DOT fr>
# Contributor: Juan Diego Tascon
# Contributor: Tom Vincent <http://tlvince.com/contact/>

pkgname=ruby-rainbow
pkgver=2.0.0
pkgrel=1
pkgdesc="Rainbow is extension to ruby's String class adding support for colorizing text on ANSI terminal"
arch=('any')
url='https://rubygems.org/gems/rainbow'
license='GPL2'
depends=('ruby')
source=("https://rubygems.org/downloads/rainbow-${pkgver}.gem")

build() {
    cd "$srcdir"
    gem install --no-user-install --ignore-dependencies -i "${pkgdir}/$(gem environment gemdir)" "rainbow-${pkgver}.gem"
}

md5sums=('5e2a70432911f5049472d1273c1521c7')
