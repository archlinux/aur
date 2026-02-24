# Maintainer: Naho <naho@users.noreply.github.com>
pkgname=flux-downloader-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern, fast YouTube downloader built with Tauri"
arch=('x86_64')
url="https://github.com/eoNaho/flux-downloader"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'libappindicator-gtk3')
provides=('flux-downloader')
conflicts=('flux-downloader')
source=("https://github.com/eoNaho/flux-downloader/releases/download/v${pkgver}/flux-downloader_${pkgver}_amd64.deb")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
  bsdtar -xf "${srcdir}/data.tar"* -C "${pkgdir}/"
}
