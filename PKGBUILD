pkgname=arch-soundpad
pkgver=0.2.0
pkgrel=1
pkgdesc="Soundpad-style app for Arch Linux with virtual mic routing"
arch=('any')
url="https://local/arch-soundpad"
license=('MIT')
depends=('python' 'tk' 'ffmpeg' 'pipewire-pulse' 'python-xlib')
makedepends=()
source=('soundpad_app.py' 'arch-soundpad' 'arch-soundpad.desktop' 'arch-soundpad.svg' 'README.md')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
install='arch-soundpad.install'

package() {
  install -Dm755 "$srcdir/soundpad_app.py" "$pkgdir/usr/share/arch-soundpad/soundpad_app.py"
  install -Dm755 "$srcdir/arch-soundpad" "$pkgdir/usr/bin/arch-soundpad"
  install -Dm644 "$srcdir/arch-soundpad.desktop" "$pkgdir/usr/share/applications/arch-soundpad.desktop"
  install -Dm644 "$srcdir/arch-soundpad.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/arch-soundpad.svg"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/arch-soundpad/README.md"
}
