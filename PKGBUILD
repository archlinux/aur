# Maintainer: orumin <dev@orum.in>

pkgname=raw-thumbnailer-entry
pkgver=1
pkgrel=1
pkgdesc="add xdg desktop entry for raw-thumbnailer"
arch=('any')
license=('MIT')
depends=('raw-thumbnailer')

package() {
  install -dm 755 "${pkgdir}/usr/share/thumbnailers"
  cat <<'EOF' > "${pkgdir}/usr/share/thumbnailers/raw.thumbnailer"
[Thumbnailer Entry]
TryExec=/usr/bin/raw-thumbnailer
Exec=/usr/bin/raw-thumbnailer -s %s %u %o
MimeType=image/x-3fr;image/x-adobe-dng;image/x-arw;image/x-bay;image/x-canon-cr2;image/x-canon-crw;image/x-cap;image/x-cr2;image/x-crw;image/x-dcr;image/x-dcraw;image/x-dcs;image/x-dng;image/x-drf;image/x-eip;image/x-erf;image/x-fff;image/x-fuji-raf;image/x-iiq;image/x-k25;image/x-kdc;image/x-mef;image/x-minolta-mrw;image/x-mos;image/x-mrw;image/x-nef;image/x-nikon-nef;image/x-nrw;image/x-olympus-orf;image/x-orf;image/x-panasonic-raw;image/x-pef;image/x-pentax-pef;image/x-ptx;image/x-pxn;image/x-r3d;image/x-raf;image/x-raw;image/x-rw2;image/x-rwl;image/x-rwz;image/x-sigma-x3f;image/x-sony-arw;image/x-sony-sr2;image/x-sony-srf;image/x-sr2;image/x-srf;image/x-x3f;
EOF
}

# vim:set ts=2 sw=2 et:
