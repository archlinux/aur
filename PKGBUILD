pkgname=polaric-connect
pkgver=0.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Utility for connect Polaric web platform to raspberry"
url="https://www.polaricsemi.com"
depends=('libssh')

build() {
  sudo cp ../polaric-connect /usr/bin/polaric-connect
}

package() {
    echo "Installing"
  sudo cp ../polaric-connect.png /usr/share/pixmaps/.
  sudo cp ../polaric-connect.desktop /usr/share/applications/.
}

post_remove() {
	sudo rm /usr/bin/polaric-connect
  sudo rm /usr/share/pixmaps/polaric-connect.png
  sudo rm /usr/share/applications/polaric-connect.desktop
}