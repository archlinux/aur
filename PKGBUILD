#Lead Contributor: revoxhere <https://github.com/revoxhere/duino-coin>
#Maintainer: Pherelo HD <pherelohd@protonmail.com>
ENABLE_FLATPAK=0
ENABLE_SNAPD=0

pkgname=duino-coin
pkgver=2.0
pkgrel=1

pkgdesc="is a cryptocurrency that can also be mined with AVR boards."
arch=('x86_64')
url="https://github.com/revoxhere/duino-coin"
license=('MIT')
optdepends=('python: needed for actually running the PC_Miner'
            'python-pip: needed for dependencies in the Miner')

sha256sums=('b23a2778b9c7641277790359f089352a1d210bc82f3e3013a8e40a60359c34fd')



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
