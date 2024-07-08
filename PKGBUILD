# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.37.1
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
sha512sums_x86_64=('541a63614f1e3bbfff30774fc5055d70302df515143cab0eb8e9a15435b33838ee4c68fbe29f6b80929d450f2ab67a9ba9621dd4b98db809d1be691aeaaf47b4')
sha512sums_i386=('2104c5b6878d6585be06e68fde09bb96939eeb689f075edb082d8bfb26f6808deb9a5566ba6e5f58728f369832821a062cfc29e39947c3e9912ecb14628e4977')
sha512sums_aarch64=('ca39eb299641fd84c4a24f01109e9ad3d29f2f4f4cbd94ef78b422ab2b67ca48ff47c5baa7f4d7d0f731c1a398e9fc770f28467b8e5fd5f818736d12558c510a')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
