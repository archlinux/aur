# Maintainer: Dadoum <contact@dadoum.ml>
# Contributor: 1Conan <me@1conan.com>

pkgname=checkra1n
pkgver=0.10.2
pkgrel=3
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
  'libirecovery3' # '>=1.0.0'
  'usbmuxd>=1.1.0'
)
options=('!strip')
source=(https://assets.checkra.in/debian/checkra1n_${pkgver}_amd64.deb)
md5sums=('214e0e25935d9d2dedc57b5659bcb4a0')
sha1sums=('d020d0fa2c783f69b50e9e8229831f08e42f7e99')
sha256sums=('229f93e0771d64455b67b46a7a09f0c7e43601f7e4f17259e520553370945dae')

package() {
  tar -xf data.tar.xz -C "$pkgdir" 
}

