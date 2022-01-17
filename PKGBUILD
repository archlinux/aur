pkgname=firefoxext
pkgver=0.0.1
pkgrel=0
pkgdesc="Install firefox extensions with the commandline"
depends=('firefox' 'gcc' 'make' 'cjson')
arch=('x86_64')
url="https://github.com/Interfiber/firefoxext"
source=("git+${url}.git")
sha256sums=('SKIP')
license=("GPL3")

build(){
    cd firefoxext
    make
}
package(){
    cd firefoxext
    sudo make install
}
