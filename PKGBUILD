# Maintainer: Marius Iacob <themariusus at gmail dot com>

pkgname=reader-bin
pkgver=0.4.3
pkgrel=1
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
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'e2af89e415e6c4c65e51fc76df4ef88e7feba5333e14a9d5694209ba26287985')
sha256sums_i686=('73efaad0c26749d9a58f51dd15198d5e4e85599f734ed92b33d4b6ffbb692635')
sha256sums_x86_64=('ec056df4f7e9122de4e2f0a8621cffe3ea7eaca331501545ab314662045e3bf2')
sha256sums_armv6h=('f240678b4ac4184dc396fa7f8c9a1be322335776ff7e633c9ae93490d2bdf8bd')
sha256sums_armv7h=('6dbf8800284cb53a6e42075022e69324d5b0f027961941988644a24acfa8e1bb')
sha256sums_aarch64=('433f4bbf6471eaa54752ac0c2adc952035a7aa6fbef2ccf8161c45cd15fb70c9')

package() {
  install -D -m755 reader "${pkgdir}/usr/bin/reader"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
