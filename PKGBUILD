# Maintainer: Advaith Madhukar <advaith.madhukar at gmail dot com>
pkgname=(sysmon)
pkgver=1.0
pkgrel=0
url="https://github.com/MatthiasSchinzel/sysmon"
pkgdesc="Graphical system monitor. Similar to windows task manager"
arch=(any)
license=(gpl)
source=(
  git+https://github.com/MatthiasSchinzel/sysmon.git
  )
sha256sums=(
    'SKIP'
    )
makedepends=(git python-setuptools)
depends=(python python-pyqtgraph python-pyqt5 python-numpy)
optdepends=(wireless_tools nvidia-utils)
build(){
 cd sysmon/
 git checkout ${pkgver}
 cd src
 python setup.py build
}
package(){
cd sysmon/src/
python setup.py build
}
