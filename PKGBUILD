# Contributor: Ben Morgan <uv.sound@gmail.com>
pkgname=moped
pkgver=2.16
pkgrel=9
pkgdesc="An advanced tool to flexibly manipulate MPD playlists"
arch=('any')
url="https://github.com/cassava/moped"
license=('GPL')
depends=("python>=3.1.2" zenity mpd)
install=moped.install
source=("https://github.com/cassava/moped/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('15e6df587c6a1a3180cbb06a4fde1e52')

package() {
    cd $srcdir/$pkgname-$pkgver

    mv install.sh.example install.sh
    chmod +x install.sh
    ./install.sh $pkgdir
}
