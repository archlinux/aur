# Maintainer: SyreeseOfficial <syreese@example.com>
pkgname=vibestt
pkgver=1.0
pkgrel=1
pkgdesc="A minimalist, high-performance speech-to-text utility for Omarchy (Hyprland + Ghostty)"
arch=('any')
url="https://github.com/SyreeseOfficial/VibeSTT"
license=('MIT')
depends=('python' 'python-sounddevice' 'python-numpy' 'python-scipy' 'python-groq' 'ghostty' 'wl-clipboard')
makedepends=('git')
source=("git+https://github.com/SyreeseOfficial/VibeSTT.git#branch=main")
sha256sums=('SKIP')

package() {
    cd "VibeSTT"
    
    # Install the script
    install -Dm755 vibestt.py "$pkgdir/usr/bin/vibestt"
    
    # We might need to handle the config dir creation in post_install or let the script do it
    # Script does it.
}
