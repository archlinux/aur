# Maintainer: Your Name <claudemods101@gmail.com>
pkgname=archconv
pkgver=1.01
pkgrel=1
pkgdesc="Convert vanilla Arch Linux to CachyOS"
arch=('any')  # Changed from x86_64 since it's a bash script
url="https://github.com/claudemods/vanillaarch-to-cachyos"
license=('GPL')
depends=('bash' 'sudo' 'git')  # Added sudo as it's commonly needed for system scripts
source=("git+https://github.com/claudemods/vanillaarch-to-cachyos.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/vanillaarch-to-cachyos"

  # Install the main script to /usr/bin
  install -Dm755 "archconv.sh" "$pkgdir/usr/bin/archconv"

  # If there are config files or other scripts, install them too
  # install -Dm644 "config.file" "$pkgdir/etc/archconv/config.file"

  # If you have a desktop file for GUI launch (optional)
  # install -Dm644 "archconv.desktop" "$pkgdir/usr/share/applications/archconv.desktop"

  # If you have icons (optional)
  # install -Dm644 "icon.png" "$pkgdir/usr/share/pixmaps/archconv.png"
}
