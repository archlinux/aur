# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=hyprland-autoname-workspaces-bin
_pkgname=${pkgname%-bin}
pkgver=1.0.0
pkgrel=1
pkgdesc='Hyprland autoname workspace.'
arch=('x86_64' 'aarch64')
url="https://github.com/cyrinux/${_pkgname}"
license=('ISC')
depends=('glibc' 'otf-font-awesome' 'hyprland')
conflicts=("hyprland-autoname-workspaces-git" "hyprland-autoname-workspaces")
provide=("hyprland-autoname-workspaces")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz"
    "${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz.sig")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_Linux_aarch64.tar.gz"
    "${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_Linux_aarch64.tar.gz.sig")
validpgpkeys=('4F7BC1FD97170A79267686A6FC9B1319726657D3', 'C5DFDE230E7B3DA1E6B5D5316A11D19BDD5F8B5E')
sha256sums_x86_64=('9d3c7a726562dcdb7b2c4df569670fe6f05f38c34d30e1ed8a7067eed976837d'
                   'SKIP')
sha256sums_aarch64=('1596a3dcf4bdafeb443a39d023ea739596ffa6767e22664c5573cb516491e820'
                    'SKIP')

package() {
    install -D -m0755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
