# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=nomachine
pkgver=5.1.62
pkgrel_i686=1
pkgrel_x86_64=1
pkgrel_armv6h=3
pkgrel_armv7h=1
pkgrel_armv8h=1
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'armv8h')
options=('!strip')
conflicts=('nxmanager nxwebplayer nxserver nxnode nxclient')
depends=('bash' 'openssh')
sha512sums_x86_64=('6504420c39b662e29ea53d95fcc06d82abce277da6762b51b0bb6f118cdc091b9e2e999d8b30dd2076e78fda360c4e143699841befb7d8574eb6434f599b787d')
sha512sums_i686=('ffced4021a88956b65dc5cab85facc06de87939dc633c4e6770009b04e5e1adc9e6bcfc24642d4f26827e3412f157da98d97c01e6902e7599dad699513a7cfa4')
sha512sums_armv6h=('9ab91382da9853a0569dac0f5f1d0829db0ec5e6b87afbfb4f3ae91d325dd424a7792de4549f9adddde883e8e3c461a0cc2e7f2c487b40c54d835d1781f41ea7')
sha512sums_armv7h=('c1348720b6efb84d52c2dcf4dc83cfd306bfa945cb6d2240f4427226e74873c96f61142dd2d9646e8eda573057dc05c26d425c44d37b1cad29d114aebcb7cce7')
sha512sums_armv8h=('6b591ffe1dbc864442e86f8248bdc7dcf2cc368299a5504548ec7fac37109078b59647942798225615a022b7de4a9b3f7593f682b6488052a59a36e28eb584be')
source_x86_64=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_x86_64}_x86_64.tar.gz")
source_i686=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_i686}_i686.tar.gz")
source_armv6h=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_armv6h}_armv6hl.tar.gz")
source_armv7h=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_armv7h}_armv7hl.tar.gz")
source_armv8h=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_armv8h}_aarch64.tar.gz")
install=nomachine.install

package()
{
  cd "$srcdir"
  mkdir "$srcdir/NX/etc" -p
  install -d "$pkgdir/usr/"
  cp -a NX "$pkgdir/usr/NX"
}

