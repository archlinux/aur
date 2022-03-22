# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname=sonic-pi-tool
pkgver=0.993
pkgrel=3
license=('GPL')
pkgdesc="A text editor with particular Esperanto functions, spell and grammar checking and machine translation"
url="https://github.com/emlyn/sonic-pi-tool"
arch=('any')
provides=('sonic-pi-tool')
conflicts=()
depends=('python' 'python-psutil' 'python-oscpy' 'psutils')
optdepends=('sonic-pi')
source=("${url}/blob/master/sonic-pi-tool.py")
md5sums=('1720a1226df9f7dfaa4e5bf6b3483529')

package() {
  sudo install -Dm755 "sonic-pi-tool.py" "/usr/bin/sonic-pi-tool"
}
