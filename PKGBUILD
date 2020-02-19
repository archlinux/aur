# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname=esperantilo-bin
pkgver=0.993
pkgrel=1
license=('GPL')
pkgdesc="A text editor with particular Esperanto functions, spell and grammar checking and machine translation"
url="http://www.esperantilo.org"
arch=('i686' 'x86_64')
provides=('esperantilo')
source=("${url}/esperantilo.bin")
md5sums=('d028ff0026fa52ae41f0b8af73a9a36d')

package() {
    chmod +x esperantilo.bin
    sudo mv esperantilo.bin /usr/bin/esperantilo
}
