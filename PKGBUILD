# Contributor: 

pkgname=v2ray-plugin
pkgver=20190114
pkgrel=1
pkgdesc='Yet another SIP003 plugin for shadowsocks, based on v2ray'
arch=('x86_64')
url='https://github.com/shadowsocks/v2ray-plugin'
license=('MIT')
#depends=('' '')
makedepends=('go')
conflicts=('v2ray-plugin-git')
source=("https://github.com/shadowsocks/v2ray-plugin/releases/download/v$pkgver/v2ray-plugin-linux-amd64-$pkgver.tar.gz"
        "https://github.com/shadowsocks/v2ray-plugin/blob/master/LICENSE")
sha256sums=('c0b07d577e271738ac51e68ddeb3fc724adad645f09c92ecdc3ea97faaaeb74a'
            '53092ce9ca01bb6941cbda1d5884e859f04f1a8aa246316db8bea1060e6f2c8e')
package() {
  install -Dm755 v2ray-plugin_linux_amd64  ${pkgdir}/usr/bin/v2ray-plugin
  install -Dm755 LICENSE ${pkgdir}/usr/share/licenses/v2ray-plugin/LICENSE
  echo "README FILE: https://github.com/shadowsocks/v2ray-plugin/blob/master/README.md"
}
