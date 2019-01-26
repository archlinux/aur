# Maintainer: LIN Ruohshoei <lin dot ruohshoei plus archlinux at gmail dot com>

pkgname=v2ray-plugin-bin
_pkgname=v2ray-plugin
pkgver=1.0
pkgrel=1
_commit_ver=8cea1a3
_arch=linux_amd64
_arch_commit=linux-amd64
pkgdesc='Yet another SIP003 plugin for shadowsocks, based on v2ray'
arch=('x86_64')
url='https://github.com/shadowsocks/v2ray-plugin'
license=('MIT')
#depends=('' '')
makedepends=('go')
conflicts=("${_pkgname}-git" "${_pkgname}")
source=("https://github.com/shadowsocks/v2ray-plugin/releases/download/v$pkgver/${_pkgname}-${_arch_commit}-$_commit_ver.tar.gz"
        "https://raw.githubusercontent.com/shadowsocks/${_pkgname}/master/LICENSE")
sha256sums=('03085f4b20437c289e1c901fe394891ad329e3bfada5465abbda2ec58ffc70ef'
            'd903af2e15f43ddc5782ec20a0f1bdd090974ebea01ab02e0b015b76283ea666')
package() {
  install -Dm755 ${_pkgname}_${_arch} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
  echo "README FILE: https://github.com/shadowsocks/v2ray-plugin/blob/master/README.md"
}
