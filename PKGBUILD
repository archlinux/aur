# Maintainer: N.E. Neal <contact at [neneal] dog com>
pkgname=termite-style-git
pkgver=r19.6c77e36
pkgrel=1
epoch=
pkgdesc="A simple program to change colors and fonts of termite in real time."
arch=('any')
url="https://github.com/adi1090x/${pkgname}"
license=('GPL')
groups=()
depends=('termite' 'bash')
makedepends=('git')
checkdepends=()
optdepends=()  
provides=()    
conflicts=() 
replaces=()
backup=()   
options=() 
install=
changelog=  
source=("${pkgname}::git+git://github.com/adi1090x/termite-style.git")
noextract=()
md5sums=(SKIP)                                                         
validpgpkeys=()

pkgver() {
	cd $startdir/$pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        cd $srcdir/$pkgname
        chmod +x setup
}


package() {
        cd "$pkgname"
        ./setup
}

