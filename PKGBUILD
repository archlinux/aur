# Maintainer: Kanishk Mishra <kanishk.mishra012@adgitmdelhi.ac.in>
pkgname=sink-switch
pkgver=1.0
pkgrel=1
pkgdesc="Simple audio sink switcher for PulseAudio/PipeWire"
arch=('any')
url="https://github.com/KanishkMishra143/sink-switch"
license=('MIT')
depends=('bash' 'libnotify' 'pipewire' 'pulseaudio-utils')
source=("https://github.com/KanishkMishra143/sink-switch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2a23c2f5ba15bec207f9d67052fba57f2aa5d1ecad0b64f160c8aa68874c2232')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/sink-switch.sh" "$pkgdir/usr/bin/sink-switch"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

