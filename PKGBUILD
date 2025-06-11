# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lena Fuhrimann

_pkgname=nancy
pkgname=${_pkgname}-bin
pkgver=1.0.49
pkgrel=1
pkgdesc='A tool to check for vulnerabilities in your Golang dependencies'
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/${_pkgname}"
license=(Apache-2.0)
provides=("${_pkgname}")
_src="${url}/releases/download/v${pkgver}/${_pkgname}"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha512sums_x86_64=('7e329369ed7156daceed5e14897c17766e4c277c807f7db6f93d3e7e89243f4f3dd4ee1f80c4732f53f88312f657cc02636be749a9b7bd44dfa181c28c1cf26b')
sha512sums_i686=('2776a456ca69f60f2f7b0d392f5410980f942729b96c00393447ea5c16b227f450aaa9ef3a66b4107661bf94658322a944359f8d9e7ed7be33f2f46bc687fb55')

package() {
  install -Dm755 "$_pkgname" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
