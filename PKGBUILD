# Maintainer: database64128 <free122448@hotmail.com>
pkgname=qv2ray-static-bin-nightly
pkgver=20211215
pkgrel=1
pkgdesc="A cross platform connection manager for V2Ray and other backends"
arch=(x86_64)
url="https://github.com/Shadowsocks-NET/Qv2ray"
license=('GPL3')
depends=('qv2ray-static-nightly-bin')
makedepends=('jq')
release=$(curl -s https://api.github.com/repos/Shadowsocks-NET/QvStaticBuild/releases/latest)

pkgver() {
    echo $release | jq -r '.tag_name' | sed 's/^nightly-//;s/-//g'
}
