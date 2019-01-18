# Contributor: 

pkgname=v2ray-plugin
pkgver=1.0
pkgrel=1
_commit_ver=8cea1a3
pkgdesc='Yet another SIP003 plugin for shadowsocks, based on v2ray'
arch=('x86_64')
url='https://github.com/shadowsocks/v2ray-plugin'
license=('MIT')
#depends=('' '')
#makedepends=('go')
conflicts=('v2ray-plugin-git')
source=("https://github.com/shadowsocks/v2ray-plugin/releases/download/v$pkgver/v2ray-plugin-linux-amd64-$_commit_ver.tar.gz"
        "https://raw.githubusercontent.com/shadowsocks/v2ray-plugin/master/LICENSE")
sha256sums=('03085f4b20437c289e1c901fe394891ad329e3bfada5465abbda2ec58ffc70ef'
            '846f705610ae389786d42d92b09f5c5d9a14b144eb52b358fdb3e3051dbb00b2')
package() {
  install -Dm755 v2ray-plugin_linux_amd64  ${pkgdir}/usr/bin/v2ray-plugin
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/v2ray-plugin/LICENSE
  echo "README FILE: https://github.com/shadowsocks/v2ray-plugin/blob/master/README.md"
}
