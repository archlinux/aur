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

sha256sums=('fb4b1ceca72a2da03d19b68a140bc1f182781fa5cbd491dc4271205c927ce25e')



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
