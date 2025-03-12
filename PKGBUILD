pkgname=better-control
pkgver=1
pkgrel=1
pkgdesc="A tool to manage system settings easily"
arch=('any')
url="https://github.com/quantumvoid0/better-control"
license=('GPL3')
depends=('gtk4' 'networkmanager' 'bluez' 'bluez-utils' 'pipewire-pulse' 'brightnessctl' 'python-gobject' 'python-pydbus')  
source=("$pkgname-$pkgver.tar.gz::https://github.com/quantumvoid0/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e09607e6b4a9ebc2075b8a2b45fd804a266c73efd44922ba8de8fa723c4f3b4')  

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/src/control.py" "$pkgdir/usr/bin/control"
    install -Dm644 "$srcdir/$pkgname-$pkgver/src/control.desktop" "$pkgdir/usr/share/applications/control.desktop"
}

