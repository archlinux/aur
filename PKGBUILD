# Maintainer(s): Derek Porcelli derekp5831@gmail.com

pkgname=lmp
pkgver=1.0.8
pkgrel=1
pkgdesc="A lightweight media player script"
arch=('x86_64')
url="https://github.com/derekporcelli/lmp"
license=('GPL')
depends=('python' 'mpv')
source=("git+git://github.com/derekporcelli/lmp.git")
sha256sums=('SKIP')
packager="Derek Porcelli derekp5831@gmail.com"

package() {
    install -Dm755 "$srcdir/lmp" "$pkgdir/usr/bin/lmp"
    install -Dm644 "$srcdir/lmp.conf" "$pkgdir/etc/lmp/lmp.conf"
}
