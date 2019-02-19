# Maintainer: LIN Ruohshoei <lin dot ruohshoei plus archlinux at gmail dot com>

pkgname=v2ray-plugin-bin
_pkgname=v2ray-plugin
pkgver=1.1.0
pkgrel=1
#_commit_ver=8cea1a3
_arch=linux_amd64
_arch_commit=linux-amd64
pkgdesc='Yet another SIP003 plugin for shadowsocks, based on v2ray (binary version)'
arch=('x86_64')
url='https://github.com/shadowsocks/v2ray-plugin'
license=('MIT')
#depends=('' '')
#makedepends=('go' 'git')
provide=("${_pkgname}")
conflicts=("shadowsocks-v2ray-plugin")
source=("https://github.com/shadowsocks/v2ray-plugin/releases/download/v$pkgver/${_pkgname}-${_arch_commit}-v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/shadowsocks/${_pkgname}/master/LICENSE")
sha256sums=('79efb20e4a8d834fdcfb5a3a1fe56ffa74d5c6eec539f4b3c51229848185f78f'
            'd903af2e15f43ddc5782ec20a0f1bdd090974ebea01ab02e0b015b76283ea666')
package() {
  install -Dm755 ${_pkgname}_${_arch} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
  echo "README FILE: https://github.com/shadowsocks/v2ray-plugin/blob/master/README.md"
}
