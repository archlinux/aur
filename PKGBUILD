# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=frc-toolchain
pkgver=2023.5
_year=2023
pkgrel=2
pkgdesc="The FIRST Robotics Competition C/C++ build system components"
arch=('x86_64')
url='https://github.com/wpilibsuite/toolchain-builder'
license=('GPL')
options=('!strip' 'libtool' 'staticlibs' '!emptydirs')
source=("https://github.com/wpilibsuite/opensdk/releases/download/v${pkgver//\./-}/cortexa9_vfpv3-roborio-academic-${_year}-x86_64-linux-gnu-Toolchain-12.1.0.tgz")
sha512sums=('1b47302a65ded692dc5105c241bb8bd95ea4fa90a28e8acc90938b9a2cdd83c502033b27439710d5e98d86a22db26cfa58e487eb1f28b3365e9dd14648cfaa81')

package() {
  mkdir -p $pkgdir/usr
  cp -r $srcdir/roborio-academic/{arm-nilrt-linux-gnueabi,bin,libexec,share/gdb} $pkgdir/usr
}
