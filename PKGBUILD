# Maintainer: Dan Johansen <strit@strits.dk>
# Maintainer: Recolic K <root@recolic.net>

pkgname=msalsdk-dbusclient-bin
_pkgname=msalsdk-dbusclient
pkgver=1.0.1
pkgrel=1
pkgdesc="Microsoft Authentication Library cross platform. Dbus client for talking to MSAL broker"
url="https://packages.microsoft.com/ubuntu/20.04/prod/pool/main/m/msalsdk-dbusclient"
license=("Unknown")
arch=("x86_64")
depends=("glibc>=2.14" "gcc-libs>=3.0" "systemd-libs>=243" "sdbus-cpp0" "microsoft-identity-broker>=1.0")
source_x86_64=("$url/${_pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('d1d1eee986c6181db1937e2a44eeb32f0c53aa5f1397c978f06f0ad15d147c50')
install=$pkgname.install

package() {
  cd "$srcdir"
  tar xvzf data.tar.gz
  cp -r "$srcdir/usr" "$pkgdir/"
}


