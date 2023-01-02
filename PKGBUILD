# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname=sonic-pi-tool
pkgver=1
pkgrel=2
license=('GPL')
pkgdesc="A handy command line utility for playing with the Sonic Pi server. It can be used instead of the Sonic Pi GUI."
url="https://github.com/emlyn/sonic-pi-tool"
arch=('any')
provides=('sonic-pi-tool')
conflicts=()
depends=('python' 'python-psutil' 'python-oscpy' 'psutils')
optdepends=('sonic-pi')
source=("https://raw.githubusercontent.com/emlyn/sonic-pi-tool/master/sonic-pi-tool.py")
md5sums=('8236645fb4351c30fc2961a5e952c370')

package() {
  install -Dm755 "sonic-pi-tool.py" "${pkgdir}/usr/bin/sonic-pi-tool"
}
