# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributer: Daurnimator <daurnimator@archlinux.org>
# Contributer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributer: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.0.6
pkgrel=2
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
source_x86_64=("https://bin.equinox.io/a/5BJEsxAFwT/ngrok-v3-3.0.6-linux-amd64")
source_i686=("https://bin.equinox.io/a/g4Tc7cHZv8h/ngrok-v3-3.0.6-linux-386")
source_armv7h=("https://bin.equinox.io/a/N1hRpSDyhf/ngrok-v3-3.0.6-linux-arm")
source_aarch64=("https://bin.equinox.io/a/3avAZQg1gJj/ngrok-v3-3.0.6-linux-arm64")
sha256sums_i686=('83adc0e65ac46f1c8cdcc0d5035acc6b41c0223e2b812de79ec092d0004fcc9a')
sha256sums_x86_64=('38b9c0279e2a5a0faf6258d1b6ac7f36134a960531b0558c3169652dfa74c6e0')
sha256sums_armv7h=('10d9b89507d253b2dab1d9a3bde0c0f596c1ea2652b02c470a9262fa5d8aa8b8')
sha256sums_aarch64=('825d02c244432f19fa9dad9189034a251701bf74dc5d9ea75559b1f2ca398569')

# In order to make Ngrok's built-in updater happy, we need to avoid modifying the binary
options=(!strip)

package() {
  cd "${srcdir}"

  # Install the program.
  install -Dm755 ngrok-v3-${pkgver}-linux-* "${pkgdir}/usr/bin/ngrok"
}

# vim: ft=sh ts=2 sw=2 et
