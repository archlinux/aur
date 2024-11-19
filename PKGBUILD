# Maintainer: wangyifan <wangyifan@acoinfo.com>
# Contributor: chengsiyuan <chengsiyuan@acoinfo.com>

pkgname=sylixos-uploader
pkgver=0.0.2
pkgrel=1
pkgdesc='A command-line tool for uploading SylixOS projects via CORBA.'
arch=(x86_64 aarch64)
url='https://cdn.git.acosail.cc/go-sylixos/sylixos-uploader'
license=(custom)
provides=("${pkgname}")
source_x86_64=(${pkgname}::${url}/releases/download/v${pkgver}/${pkgname}-linux-amd64-v${pkgver})
sha256sums_x86_64=('SKIP')
source_aarch64=(${pkgname}::${url}/releases/download/v${pkgver}/${pkgname}-linux-arm64-v${pkgver})
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 ${pkgname} -t "${pkgdir}/usr/bin"
}

