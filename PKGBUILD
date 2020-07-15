# Maintainer: Michael Duell <aur@akurei.me>
# Contributor: Danilo Bargen <aur at dbrgn dot ch>
pkgname=otii
pkgver=2.6.3
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
sha384sums=('cfae298aab87e918d0174712b59532a4d0f8222c98315043b37072b0b5b8d16ebbcf0692b7b2ec7aef443f0cde2c0ea6'
            'd3817ebaebb1737f4a2b32b3f6d10484c7f1b0d83da818b03cbb71077dd7e2cbae7dbf02a963e1d8f679a8cfa8d00ed4')
