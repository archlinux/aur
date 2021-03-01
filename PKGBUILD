#Lead Contributor: revoxhere <https://github.com/revoxhere/duino-coin>
#Maintainer: Pherelo HD <pherelohd@protonmail.com>
ENABLE_FLATPAK=0
ENABLE_SNAPD=0

pkgname=duino-coin
pkgver=2.2
pkgrel=1

pkgdesc="is a cryptocurrency that can also be mined with AVR boards."
arch=('x86_64')
url="https://github.com/revoxhere/duino-coin"
license=('MIT')
optdepends=('python: needed for actually running the PC_Miner'
            'python-pip: needed for dependencies in the Miner')

sha256sums=('891968c2661a30d047dbe92aef58378d706ca3eceb15b00a689c9fbaa05a9c72')



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
