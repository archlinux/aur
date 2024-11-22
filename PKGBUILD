# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>
# Co-Maintainer: Matthias Loibl <mail@matthiasloibl.com>

pkgname=jsonnet-bundler-bin
pkgver=0.6.0
pkgrel=2
pkgdesc="jsonnet package manager"
arch=('x86_64' 'aarch64')
url="https://github.com/jsonnet-bundler/jsonnet-bundler"
license=('Apache-2.0')
source_x86_64=("jb-v${pkgver}-x86_64::https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v${pkgver}/jb-linux-amd64")
source_aarch64=("jb-v${pkgver}-aarch64::https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v${pkgver}/jb-linux-arm64")
sha256sums_x86_64=('78e54afbbc3ff3e0942b1576b4992277df4f6beb64cddd58528a76f0cd70db54')
sha256sums_aarch64=('19f2da64816137cd87a82dd963c752ff4b7c8701fc1ed7b979c356321dcf3f5a')

package() {
  install -Dm 755 "${srcdir}/jb-v${pkgver}-${CARCH}" "${pkgdir}/usr/bin/jb"
}
