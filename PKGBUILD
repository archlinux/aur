# Maintainer: Michael Duell <aur@akurei.me>
# Contributor: Danilo Bargen <aur at dbrgn dot ch>
pkgname=otii
pkgver=2.6.2
pkgrel=1
pkgdesc="Energy consumption analysis software by Qoitech"
arch=('x86_64')
url="https://www.qoitech.com/download"
license=('custom')
depends=('qt5-serialport' 'qt5-quickcontrols2' 'qt5-svg'
         'gcc-libs-multilib' 'hicolor-icon-theme')
source=("https://www.qoitech.com/downloads/${pkgname}_${pkgver}.deb"
        "LICENSE")

validpgpkeys=()

prepare() {
    tar xf data.tar.xz
}

package() {
    cp -a usr "$pkgdir/"
    cp -a lib "$pkgdir/usr/"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
sha384sums=('a28ef02174331948acff3ed5bb887873315371d61502ec60c1cf32a8fbd5ea9e62948d88817254db4a018cef6ef79151'
            'd3817ebaebb1737f4a2b32b3f6d10484c7f1b0d83da818b03cbb71077dd7e2cbae7dbf02a963e1d8f679a8cfa8d00ed4')
