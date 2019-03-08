# Maintainer: N.E. Neal <spam at [part of name before neal without dots] dog com>
pkgname=termite-style
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="A simple program to change colors and fonts of termite in real time."
arch=('any')
url="https://github.com/adi1090x/${pkgname}"
license=('GPL')
groups=()
depends=('termite' 'bash')
makedepends=()
checkdepends=()
optdepends=()  
provides=()    
conflicts=() 
replaces=()
backup=()   
options=() 
install=
changelog=  
source=("https://github.com/adi1090x/${pkgname}/archive/master.zip")
noextract=()
md5sums=(SKIP)                                                         
validpgpkeys=()
        
prepare() {
        cd "$pkgname-master"
        chmod +x setup
}


package() {
        cd "$pkgname-master"
        ./setup
}

