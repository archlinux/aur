# Maintainer: dizziee <jjdizz1l@proton.me>
#
# Nuvio — desktop media player (AUR binary package).
# Installs the signed Arch package attached to the NuvioLinux-unofficial
# GitHub release — no compilation. The package is built from the upstream
# NuvioMedia/NuvioDesktop source release; only pkgrel is maintained by
# this repo (byte-by-byte upstream source).
#
# Bump on every release: pkgver/pkgrel, the source URLs, and sha256sums[0]
# (grab it from the release's SHA256SUMS.txt).

pkgname=nuvio-linux-bin
pkgver=0.1.21alpha
pkgrel=1
pkgdesc="Nuvio desktop media player — upstream source packaged for Arch Linux (binary)"
arch=('x86_64')
url="https://github.com/NuvioMedia/NuvioDesktop"
license=('GPL3')
depends=('mpv' 'webkit2gtk-4.1' 'gtk3' 'glibc' 'gcc-libs' 'libstdc++' 'libx11' 'libxcomposite' 'libxext' 'libxrender' 'libxi' 'libxtst')
install=nuvio-linux-bin.install
provides=('nuvio-linux')
conflicts=('nuvio-linux' 'nuvio-linux-git')
source=(
  "nuvio-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/JJDizz1L/NuvioLinux-unofficial/releases/download/v0.1.21-alpha-1/nuvio-linux-0.1.21alpha-1-x86_64.pkg.tar.zst"
  "nuvio-linux-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst.sig::https://github.com/JJDizz1L/NuvioLinux-unofficial/releases/download/v0.1.21-alpha-1/nuvio-linux-0.1.21alpha-1-x86_64.pkg.tar.zst.sig"
)
sha256sums=(
  '150a2470d13e5ee1e658b14e5ff90f21e749601e2e9e82891d95aa53cfb2ba0b'
  'SKIP'
)
validpgpkeys=('9201A54A09675CBEBAD08647EDDA55C8236D6C88')