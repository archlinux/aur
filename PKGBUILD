# Maintainer: Dadoum <contact@dadoum.ml>
# Contributor: 1Conan <me@1conan.com>

pkgname=checkra1n
pkgver=0.10.1
pkgrel=1
pkgdesc="checkra1n is a semi-tethered jailbreak, developed primarily by Luca Todesco (qwertyoruiop). It's based on the checkm8 bootrom exploit released by axi0mx. checkra1n supports iOS 12.3 and newer."
license=('unknown')
url="https://checkra.in"
conflicts=('checkra1n-cli')
provides=('checkra1n-cli')
arch=('x86_64')
depends=(
  'glibc>=2.24'
  'ncurses5-compat-libs>=6.0'
  'pango>=1.37.0'
  'atk>=2.15.0'
  'gdk-pixbuf2>=2.30.0'
  'glib2>=2.45.0'
  'fontconfig>=2.11.1'
  'freetype2>=2.2.1'
  'gtk3>=3.18.0'
  'libusb>=1.0.19'
  'libusbmuxd>=2.0.1'
  'libplist>=2.1.0'
  'libirecovery-git>=1.0.0'
  'usbmuxd>=1.1.0'
)
options=('!strip')
source=(https://assets.checkra.in/debian/checkra1n_${pkgver}_amd64.deb)
md5sums=('ad771aec22e398797f19e59ef77e2aa5')
sha1sums=('a287ac0d42ec791a700f6e79ba079e22dddd2f7d')
sha256sums=('4b806dd241b0854a9c7f620ad2da350356c9985afd928dc57fecf9b5a1c6b0f5')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
}
