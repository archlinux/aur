#Lead Contributor: revoxhere <https://github.com/revoxhere/duino-coin>
#Maintainer: Pherelo HD <pherelohd@protonmail.com>
ENABLE_FLATPAK=0
ENABLE_SNAPD=0

pkgname=duino-coin
pkgver=2.4
pkgrel=1

pkgdesc="is a cryptocurrency that can also be mined with AVR boards."
arch=('x86_64')
url="https://github.com/revoxhere/duino-coin"
license=('MIT')
optdepends=('python: needed for actually running the PC_Miner'
            'python-pip: needed for dependencies in the Miner')

sha256sums=('707a762ccf0eecb65bbd07c9a5a383ec935f26d987f2ebe0b991c5ace49594de')



source=("$pkgname-$pkgver.tar.gz::https://github.com/revoxhere/duino-coin/archive/$pkgver.tar.gz")



prepare(){

 mkdir "tmp" 

}

build(){

     
mkdir -p "~/duco"
}

package(){
mkdir -p "~/duco"
cp "$pkgname-$pkgver.tar.gz" "$HOME/"
cd "$HOME/"
tar -xzf "$pkgname-$pkgver.tar.gz"
rm -rf "$pkgname-$pkgver.tar.gz"
}

