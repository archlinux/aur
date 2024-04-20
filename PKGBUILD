# Maintainer: Shayne Hartford <shaybox@shaybox.com>

_pkgname=sfp
pkgname="${_pkgname}-ui-bin"
pkgver=0.0.54
pkgrel=2
pkgdesc="This utility is designed to allow you to apply skins to the modern Steam client"
arch=("x86_64")
url="https://github.com/PhantomGamers/${_pkgname}"
license=("MIT")
options=("!strip" "!debug") # https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/19
depends=("ttf-ms-fonts" "dotnet-runtime-7.0")
source=("${url}/releases/download/${pkgver}/SFP_UI-linux-x64-net7.tar.gz")
sha512sums=("730dbee62bad3015d4462fbeab461d29e9209dc0f07632e5097b8532b6b724bf354cc7cb4316cfb1cedbf958f3c3596f74fd4cd1dbed72ee94d361a21e3a4984")

package() {
  install -Dm755 "${srcdir}/SFP_UI" "${pkgdir}/usr/bin/SFP_UI" 
}
