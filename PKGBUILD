# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Maintainer: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=deepin-qml-widgets
pkgver=0.0.2.20150423102550
_srcdirname=deepin-qml-widgets-0.0.2+20150423102550~daef82ffb6
pkgrel=1
pkgdesc='Deepin QML widgets'
arch=('i686' 'x86_64')
url="https://gitcafe.com/Deepin/deepin-qml-widgets"
license=('GPL3')
groups=('deepin')
depends=('qt5-multimedia' 'qt5-webkit' 'qt5-imageformats'
         'qt5-graphicaleffects' 'qt5-x11extras')
conflicts=('dde-qml-gettext-plugin')
provides=('dde-qml-gettext-plugin')
replaces=('dde-qml-gettext-plugin')
options=('!emptydirs')
source=("http://packages.linuxdeepin.com/deepin/pool/main/d/deepin-qml-widgets/deepin-qml-widgets_0.0.2+20150423102550~daef82ffb6.tar.gz")
sha256sums=('861340d0ca269f34cde2ddc2ed6262a4b966c269886f5d764686df8a3bc6e13d')

build(){
  cd "${_srcdirname}"

  qmake && make
}

package() {
  cd "${_srcdirname}"

  make INSTALL_ROOT="${pkgdir}" install
}
