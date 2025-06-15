# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.41.0
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
sha512sums_x86_64=('2b4ff06baeedc607c19fc48b3bc20212a0c98ac741e5b154a51e702ec5cb80360c2b95e58b7d1e0008b62f80367b7968f7743ce9a6c71ad0bac9b9ae3f54f0dc')
sha512sums_i386=('04f09a85512d5da7a757e50e5e0d3fd65adb4e4a56e8298dc494858fced197f5115139fd5a1c8f89c967fd095e74fc82927eec7890cbe31b9191115dcb5bd5fa')
sha512sums_aarch64=('4f9f4933f094352ef4197f73c3636d176c17c370f3922d25927c0afb3be2c111f1b1483799beb2b020bec5e447f30131b4672f1bf5f1ae410ba000b24adfbaab')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
