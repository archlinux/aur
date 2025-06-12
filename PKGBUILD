# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lena Fuhrimann

_pkgname=nancy
pkgname=${_pkgname}-bin
pkgver=1.0.50
pkgrel=1
pkgdesc='A tool to check for vulnerabilities in your Golang dependencies'
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/${_pkgname}"
license=(Apache-2.0)
provides=("${_pkgname}")
_src="${url}/releases/download/v${pkgver}/${_pkgname}"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha512sums_x86_64=('2f5ff67e42e9080852e6121dd48b12e1f7d9ebed528371f9a7ac31c57b3a1bec4245fee05409ec4e340448617cdb6da38b07db43cf9da24df1fc3a51288e180d')
sha512sums_i686=('10b1720f30f4e10a6f9aed35bf000a37a0a6e40510448bcf3aafa68bb04fcc47a7f1266470de4f2fdb861bcf6fa3a0195a42be982e8295539b201dcd6455a2e3')

package() {
  install -Dm755 "$_pkgname" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
