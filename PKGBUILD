# Maintainer: Marius Iacob <themariusus at gmail dot com>

pkgname=reader-bin
pkgver=0.6.1
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
sha256sums_i686=('723cdae972d024e62b25e118aaf1943305cf522eb4fefaf8c2f6d605e5f0f152')
sha256sums_x86_64=('012491e2504551309b7804c219187296c944f13091e70c364a21dd3f368a5ee8')
sha256sums_armv6h=('4dda5c2d4a4b9985e3a55f1e9f63e64dba63c9ceb0255342ca35b15c3c727947')
sha256sums_armv7h=('9b5995ef79ca23f4f4bbfc90137c91b5a903ed1af670bc24125c7f29fa5b1f27')
sha256sums_aarch64=('8c0a5db31344efc9fff57bc98e61b662fb65d959dcb3e45425d86b5f1215f6f6')

package() {
  install -D -m755 reader "${pkgdir}/usr/bin/reader"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/reader/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/reader/README.md"
}
