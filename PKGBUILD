# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux AT free DOT fr>
# Contributor: Juan Diego Tascon
# Contributor: Tom Vincent <http://tlvince.com/contact/>

pkgname=ruby-rainbow
pkgver=1.1.4
pkgrel=4
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

md5sums=('c5bb469c89b151668f8e4eeb37e98cbf')
