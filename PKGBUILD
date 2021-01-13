#Lead Contributor: revoxhere <https://github.com/revoxhere/duino-coin>
#Maintainer: Pherelo HD <pherelohd@protonmail.com>
ENABLE_FLATPAK=0
ENABLE_SNAPD=0

pkgname=duino-coin
pkgver=1.9.1
pkgrel=1

pkgdesc="is a cryptocurrency that can also be mined with AVR boards."
arch=('x86_64')
url="https://github.com/revoxhere/duino-coin"
license=('MIT')
optdepends=('python: needed for actually running the PC_Miner'
            'python-pip: needed for dependencies in the Miner')

sha256sums=('1b022473abafa2faa70a93a38d06c66e8fe19baab880e4e61f2865d5b3fc75c6')



source=("$pkgname-$pkgver.tar.gz::https://github.com/revoxhere/duino-coin/archive/1.9.1.tar.gz")



prepare(){

	cd "$pkgname-$pkgver"

}

build(){

     
mkdir -p "~/duco"
}

package(){
mkdir -p "~/duco"
cp "$pkgname-$pkgver.tar.gz" "$HOME/"
}
