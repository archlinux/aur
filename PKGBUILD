# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.68.2
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url=https://github.com/ekristen/aws-nuke
license=('MIT')
provides=('aws-nuke')
conflicts=('aws-nuke')
_src="${url}/releases/download/v${pkgver}/aws-nuke-v${pkgver}-linux"
source_x86_64=("$_src"-amd64.tar.gz)
source_aarch64=("$_src"-arm64.tar.gz)
source_armv7h=("$_src"-arm7.tar.gz)
sha256sums_x86_64=('549957c1cc3525b12950ca27c60bf4fe43448faa8634d0f641e6c6d0545c583d')
sha256sums_aarch64=('e115512351786b35e847a0128f797b3b34ee874f584afdcf9e22a605f8fe219f')
sha256sums_armv7h=('cdba3b277c112119bbd98cbe9ae394bd98f256c14d05680994f44ae6f18d3eaf')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
