# Maintainer: step21 <step21 at devtal dot de>

pkgname=safejumper
pkgver="2015.12.31"
pkgrel=1
pkgdesc="VPN client for proxy_sh. Safejumper is a lightweight OpenVPN client specifically designed for the Proxy.sh VPN network. "
arch=('x86_64')
url="https://proxy.sh/linux"
license=('custom:Copyright (c) 2015 proxy.sh, Andrei Anifriev')
depends=('openvpn')
conflicts=('')
install=$pkgname.install
source=('https://proxy.sh/safejumper_linux.zip')
md5sums=('cbfe7452a20197ace291f47a64949729')

package()
{
  mkdir -p $pkgdir/opt
  unzip $srcdir/safejumper_linux.zip
  ar x $srcdir/safejumper_$pkgver-1_amd64.deb
  tar -xf $srcdir/data.tar.xz
  cp -rp $srcdir/opt/safejumper /tmp/safejumper-opt
  cp -rp $srcdir/usr/ /tmp/safejumper-usr
}
