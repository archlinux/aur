# Maintainer: DaniD3v <nichtdu.login@gmail.com>

pkgname="jellydrift-bin"
pkgdesc="Free racing game made by the youtuber Dani"
url="https://danidev.itch.io/jelly-drift"

pkgver="1.0.0"
pkgrel=1

license=("unknown")

source=("jellydrift.sh" "jellydrift.desktop" "https://github.com/DaniD3v/aur-files/raw/main/JellyDrift.tar.xz")
arch=("x86_64")

sha256sums=("d182a56a1ce556f4c2ddaa674d70be4043a9db396b21d92d8cff1be5349e9a48" "56279e3d77e2126a5886856923005d965c20b57d792142606badb71744423ab2" "364453f1d9f8250710d0e2c571c66922db93ee422aad33813a71914cc5eb757f")

package() {
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir "${pkgdir}/usr/bin"

  chmod +x "${srcdir}/JellyDrift/JellyDriftLinux.x86_64"
  cp -R "${srcdir}/JellyDrift" "${pkgdir}/usr/share"

  cp "${srcdir}/jellydrift.desktop" "${pkgdir}/usr/share/applications"
  cp "${srcdir}/jellydrift.sh" "${pkgdir}/usr/bin/jellydrift"
}
