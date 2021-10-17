# Maintainer: Xuanrui Qi <xuanrui@xuanruiwork>
pkgname=rebuild-initramfs-dracut
pkgver=1.4.1
pkgrel=1
pkgdesc="A helper script to rebuild initramfs images using dracut"
arch=('any')
url="https://github.com/xuanruiqi/rebuild-initramfs-dracut-arch"
license=('MIT')
groups=()
depends=("dracut")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xuanruiqi/${pkgname}-arch/archive/${pkgver}.tar.gz")
sha256sums=('ee8a9d600814603bedc793c566adc8222f27e136fa55136ed9ecb25691c87dc2')

package() {
  cd "${srcdir}/${pkgname}-arch-${pkgver}"

  install -Dm755 rebuild-initramfs "${pkgdir}/usr/bin/rebuild-initramfs"
  install -Dm644 rebuild-initramfs.1 "${pkgdir}/usr/share/man/man1/rebuild-initramfs.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
