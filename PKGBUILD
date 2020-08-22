# Maintainer: HMH <henry@freedesk.net>

pkgname=weylus-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Weylus - Use your tablet as graphic tablet/touch screen on your computer."
arch=('x86_64')
url="https://github.com/H-M-H/Weylus"
license=('AGPL3')
source=("$pkgname-$pkgver.zip::https://github.com/H-M-H/Weylus/releases/download/v$pkgver/linux.zip")
sha256sums=('854b7717d6d8f0133ba6cbf406c422b72aa38c7a44b80da75b7bd064286d6d50')

package() {
    install -vDm755 weylus "$pkgdir/usr/bin/weylus"
}

depends=(libxtst libxcursor libxinerama libxft libxrandr libxcomposite glu)
