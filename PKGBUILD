# Maintainer(s): Derek Porcelli derekp5831@gmail.com

pkgname=lmp
pkgver=1.0.8
pkgrel=1
pkgdesc="A lightweight media player script"
arch=('x86_64')
url="https://github.com/derekporcelli/lmp"
license=('GPL')
depends=('python' 'mpv')
source=("lmp::git://github.com/derekporcelli/lmp.git")
sha256sums=('06b475cecf12f158a59400012522f745206f36c4404f95d7fe6c11a1f3d4b8dd'
            '3c7fabf7f2d37805cd1c74dea497873d07ab3fd049014fc104d1214c636c6781')
packager="Derek Porcelli derekp5831@gmail.com"

package() {
    install -Dm755 "$srcdir/lmp" "$pkgdir/usr/bin/lmp"
    install -Dm644 "$srcdir/lmp.conf" "$pkgdir/etc/lmp/lmp.conf"
}
