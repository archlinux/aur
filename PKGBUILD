# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lena Fuhrimann

_pkgname=nancy
pkgname=${_pkgname}-bin
pkgver=1.0.52
pkgrel=1
pkgdesc='A tool to check for vulnerabilities in your Golang dependencies'
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/${_pkgname}"
license=(Apache-2.0)
provides=("${_pkgname}")
_src="${url}/releases/download/v${pkgver}/${_pkgname}"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha512sums_x86_64=('50e3ec1bad5ddea36005c3d2b81306907cf0636548432fce22ef5205afa2b7690376ca68c7faeb134567a9d56ed37b53f0a2e0023731aa9cb04b21f6982b6af9')
sha512sums_i686=('19a8bb4aa546a93577b35c540d64c6b4ed777a75a5eaa2ec3e4d0fccf26a44adf5e8b3705ea888186926b5eed0936799b36bf8615a34a0bc6a3c1f960a828013')

package() {
  install -Dm755 "$_pkgname" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
