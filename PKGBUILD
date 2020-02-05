# Maintainer: Skye Viau <skye.viau@gmail.com>
pkgname="checkra1n"
pkgver="0.9.8"
pkgrel="1"
pkgdesc="A community project to provide a high-quality semi-tethered jailbreak to all, based on the ‘checkm8’ bootrom exploit."
arch=("x86_64")
url="https://checkra.in/"
license=('unknown')
source=("https://assets.checkra.in/downloads/linux/cli/x86_64/accb40d1ca1746849c485cb8e6e2b57cc2ad49faef41018143673deab03f6788/checkra1n")
sha256sums=("accb40d1ca1746849c485cb8e6e2b57cc2ad49faef41018143673deab03f6788")

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/checkra1n" "${pkgdir}/usr/bin/checkra1n"
  chmod +x "${pkgdir}/usr/bin/checkra1n"
}
