# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgbase=suse-fonts
pkgname=(ttf-suse otf-suse woff2-suse)
pkgver=2.000
pkgrel=1
pkgdesc="sans serif typeface designed by René Bieder, supports over 200 Latin-based languages"
arch=(any)
url="https://github.com/SUSE/suse-font"
license=(OFL-1.1)
options=(!strip)
source=("https://github.com/SUSE/suse-font/releases/download/v${pkgver}/suse-font-v${pkgver}.zip")
sha256sums=('48cde2e852bf52b78d6c6a7c7109e85e6a6302f94f9e4468a42a523a24a69349')

package_ttf-suse() {
  cd "suse-font-v${pkgver}"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd fonts/ttf
  install -Dm644 SUSE*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
}

package_otf-suse() {
  cd "suse-font-v${pkgver}"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd fonts/otf
  install -Dm644 SUSE*.otf -t "${pkgdir}/usr/share/fonts/OTF"
}

package_woff2-suse() {
  cd "suse-font-v${pkgver}"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd fonts/webfonts
  install -Dm644 SUSE*.woff2 -t "${pkgdir}/usr/share/fonts/WOFF2"
}
