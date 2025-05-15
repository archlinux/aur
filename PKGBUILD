# Maintainer: Marius Iacob <themariusus at gmail dot com>

pkgname=reader-bin
pkgver=0.5.0
pkgrel=0
pkgdesc="A minimal command line reader offering better readability of web pages on the CLI."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mrusme/reader"
license=('GPL-3.0')
provides=('reader')
conflicts=('reader')
source=("https://raw.githubusercontent.com/mrusme/reader/v${pkgver}/LICENSE"
	"https://raw.githubusercontent.com/mrusme/reader/v${pkgver}/README.md")
source_i686=("reader_${pkgver}_i686.tar.gz::https://github.com/mrusme/reader/releases/download/v${pkgver}/reader_${pkgver}_linux_386.tar.gz")
source_x86_64=("reader_${pkgver}_x86_64.tar.gz::https://github.com/mrusme/reader/releases/download/v${pkgver}/reader_${pkgver}_linux_amd64.tar.gz")
source_armv6h=("reader_${pkgver}_armv6h.tar.gz::https://github.com/mrusme/reader/releases/download/v${pkgver}/reader_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("reader_${pkgver}_armv7h.tar.gz::https://github.com/mrusme/reader/releases/download/v${pkgver}/reader_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("reader_${pkgver}_aarch64.tar.gz::https://github.com/mrusme/reader/releases/download/v${pkgver}/reader_${pkgver}_linux_arm64.tar.gz")
sha256sums=(SKIP
            SKIP)
sha256sums_i686=('cdbe60cf6e57c5c1e04b9621809521ba2b822462f30ceb93d141e082f0c47302')
sha256sums_x86_64=('27ade0f0ba0d6989923de1dd61309b22773cf1f5b0b7f39b54ab67528accb3a4')
sha256sums_armv6h=('f1646ce95045b3290d04a732dfd2c33924602197f9148266da97f02ca8a37bfc')
sha256sums_armv7h=('934009929bde628476b8942401bb9c979338ae3fce793c00b23412ed9867a636')
sha256sums_aarch64=('d8ca0b53e1a19452df075af8471e6e78516d9dddf39deade26c8d4c01643c750')

package() {
  install -D -m755 reader "${pkgdir}/usr/bin/reader"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/reader/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/reader/README.md"
}
