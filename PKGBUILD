# Maintainer: bcoiner <x6ji7ar9 at anonaddy dot me>

pkgname=nvidia-powerd-dinit
pkgver=1
pkgrel=1
pkgdesc="Dinit service replacement files for nvidia-powerd.service"
arch=('any')
license=('GPL-3.0')
depends=('dinit' 'NVIDIA-MODULE')
source=('nvidia-powerd')
sha256sums=('c0a5a4af6b6da12c0891822e382c6d9677c781238bd1b34778559f15cbe1373e')

package() {
    install -Dm644 nvidia-powerd "$pkgdir/etc/dinit.d/nvidia-powerd"
}

