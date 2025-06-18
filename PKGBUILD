# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lena Fuhrimann

_pkgname=nancy
pkgname=${_pkgname}-bin
pkgver=1.0.51
pkgrel=1
pkgdesc='A tool to check for vulnerabilities in your Golang dependencies'
arch=(x86_64 i686)
url="https://github.com/sonatype-nexus-community/${_pkgname}"
license=(Apache-2.0)
provides=("${_pkgname}")
_src="${url}/releases/download/v${pkgver}/${_pkgname}"
source_x86_64=("${_src}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${_src}-v${pkgver}-linux-386.tar.gz")
sha512sums_x86_64=('2847fe52396a82d82fd4ad0202e5beeb46ffc59319140da83072a1f6626114cefb5b4048bdcf7a473b343480c354a354af5f5620f74b8d589f63b8ae7dcfca0b')
sha512sums_i686=('013fdd5526360214114a108b60f3995ecb5dd5277996b1dea052a11c03e76550542263039a9fc0679abbfad8c0992d684f78d2f437d49e43e12eceb5d36488b4')

package() {
  install -Dm755 "$_pkgname" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
