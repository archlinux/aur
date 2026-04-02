# Mantenedor: Setimo <gustavo.gianeli@hotmail.com>
pkgname=arch-update-full
pkgver=1.0
pkgrel=1
pkgdesc="Protocolo Cyberpunk: Automatizador de atualizações completas (Pacman, AUR, Flatpak)"
arch=('any')
url="https://github.com/GustavoGianeli/arch-update-full"
license=('MIT')
depends=('pacman' 'yay' 'flatpak')
source=("arch-update-full" "arch-update-full.desktop")
sha256sums=('0c11384eb1a148c1296ddd449d99d1cc4e61ba7be37a3861bc6d7c5ec077b00b'
            '9a2a9da0eef95d51136b4b506c89979d6249f95bce405798f40892f234e20c0d')

package() {
  # Instala o script executável
  install -Dm755 "${srcdir}/arch-update-full" "${pkgdir}/usr/bin/arch-update-full"
  
  # Instala o atalho no menu de aplicativos (GNOME/KDE)
  install -Dm644 "${srcdir}/arch-update-full.desktop" "${pkgdir}/usr/share/applications/arch-update-full.desktop"
}
