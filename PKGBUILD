# Maintainer: Skye Viau <skye.viau@gmail.com>
pkgname="checkra1n"
pkgver="0.9.8"
pkgrel="2"
pkgdesc="A community project to provide a high-quality semi-tethered jailbreak to all, based on the ‘checkm8’ bootrom exploit."
arch=("x86_64")
url="https://checkra.in/"
license=('unknown')
source=("https://assets.checkra.in/downloads/linux/cli/x86_64/checkra1n")
sha256sums=("eda98d55f500a9de75aee4e7179231ed828ac2f5c7f99c87442936d5af4514a4")

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/checkra1n" "${pkgdir}/usr/bin/checkra1n"
  chmod +x "${pkgdir}/usr/bin/checkra1n"
}
