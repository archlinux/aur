# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributer: Daurnimator <daurnimator@archlinux.org>
# Contributer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributer: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.0.2
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
source_x86_64=("https://bin.equinox.io/a/jdsafwmenf1/ngrok-v3-3.0.2-linux-amd64")
source_i686=("https://bin.equinox.io/a/bMi8nSfDUun/ngrok-v3-3.0.2-linux-386")
source_armv7h=("https://bin.equinox.io/a/6JNUGgXwPtj/ngrok-v3-3.0.2-linux-arm")
source_aarch64=("https://bin.equinox.io/a/3iaR1eWaNhF/ngrok-v3-3.0.2-linux-arm64")
sha256sums_i686=('9970ce783fc65d76efaf295eb57ba64926e25f372af44c944777c6d875ae29e4')
sha256sums_x86_64=('a5feb27e78c03dcc9859f56c361fd0219eedf5d8fefdee49bfc18ca3ace44643')
sha256sums_armv7h=('c21d0d895fb9f56168f1196430cd15b8c0f2da645767905b0b380da9e12bae56')
sha256sums_aarch64=('bcbc6100c9113a2bc87079d4f93cf89e58f1e9236764bf616806aba799ae5460')

package() {
  cd "${srcdir}"

  # Install the program.
  install -Dm755 ngrok-v3-${pkgver}-linux-* "${pkgdir}/usr/bin/ngrok"
}

# vim: ft=sh ts=2 sw=2 et
