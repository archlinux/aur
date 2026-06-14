# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.52.0
pkgrel=1
pkgdesc="AWS cloud account cleaning tool"
url="https://github.com/gruntwork-io/${_base}"
arch=(x86_64 i386 aarch64)
license=(MIT)
conflicts=("${_base}")
provides=("${_base}")
source_x86_64=(${_base}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_base}_linux_amd64)
source_i386=(${_base}-${pkgver}-i386::${url}/releases/download/v${pkgver}/${_base}_linux_386)
source_aarch64=(${_base}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_base}_linux_arm64)
sha512sums_x86_64=('338f2d0e0a5307b90295438fef50a9d47aa78ebb147ae44e3f7e6e345851cad133c57f4310d61ddbc85bd536e23a65660210bc32ac12d4cc5596bb129a302835')
sha512sums_i386=('b4f4b24925b47f6079421dcec87015164fac4850380d724c664526ee7a1f500606432e5716f475cb1c2b6b7651150586dba27be4610cdcf9154cc5cf2b354a23')
sha512sums_aarch64=('6e0a63251b061040e150ce66fe8c57c539bba8532b8bca8add869d8c93921c39376ec211940b9ab2f53bd7affd71509531ac4f866ce152878080b57a1aca871c')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
