# Maintainer: <thysupremematrix at tuta dot io>

# Ported from Manjaro Gitlab, and edited a bit
pkgname=nautilus-empty-file
pkgver=1.2
pkgrel=1
pkgdesc="Provides context menu 'New Document' functionality for Nautilus"
arch=('any')
depends=('nautilus' 'xdg-user-dirs')
source=('https://gitlab.manjaro.org/packages/community/gnome/nautilus-empty-file/-/raw/master/create-template'
        'https://gitlab.manjaro.org/packages/community/gnome/nautilus-empty-file/-/raw/master/create-template.desktop')
sha256sums=('a9130afff6e8b244648d41d27c70fa7f6e1fa214399f364c9954b98cc63db142'
            'f57328e9739108673f538b9c47680a1e30d4fadd731ea25cb3f16580f50c0eb3')

package() {
  install -Dm755 create-template -t "$pkgdir/usr/bin/"
  install -Dm644 create-template.desktop -t "$pkgdir/etc/skel/.config/autostart/"
}

