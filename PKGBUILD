# Maintainer: Michael Duell <aur@akurei.me>
# Contributor: Danilo Bargen <aur at dbrgn dot ch>
pkgname=otii
pkgver=2.7.4
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
b2sums=('14a6784bc31204f54e1048c0e97d021af261162cf6606b1da4745b8397fe94e9fff3326f402f8c72309f32886e2452bccaf68260759c5f335351917ed124f5ba'
        'c98463c76cc9ffa3321cf55d75a127bd65fd805e7892dba2ea4104eb71c89d201ad765310b78ad444905fdcefc613f9d02c1f3e0b2979c99753a0c31a755fd00')
