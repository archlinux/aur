# Maintainer: Ivan Burmin <osguot@vivaldi.net>
#
# List of supported printers:
#
# === BM Series ================================================================
#
# BM1800      BM1800W     BM2100      BM2100A     BM2100ANW  BM2100NW    BM2200
# BM2200A     BM2200AN    BM2200ANW   BM2200AW    BM2200F    BM2200FN    BM2200FNW
# BM2200FW    BM2200N     BM2200NW    BM2200W     BM2300     BM2300A     BM2300ANW
# BM2300AW    BM2300NW    BM2300W     BM2301W     BM2303W    BM2312NW    BM2316W
# BM2318NW    BM2336W     BM2345W     BM2400      BM2400A    BM2400ANW   BM2400NW
# BM2408      BM2408A     BM2408ANW   BM2408NW    BM2460     BM2460A     BM2460ANW
# BM2460NW    BM4000ADN   BM4000ADW   BM4000FDN   BM4000FDW  BM4005ADN   BM4005FDN
# BM4100FDN   BM4100FDW   BM4200AD    BM4200ADN   BM4200ADW  BM4200D     BM4200DN
# BM4200DW    BM4208AD    BM4208ADN   BM4208D     BM4208DN   BM4208DW    BM4210ADN
# BM4210ADW   BM4210DW    BM4240ADW   BM4248ADW   BM4300ADW  BM4308ADW   BM4310ADN
# BM4310ADW   BM5100ADN   BM5100ADW   BM5100FDN   BM5100FDW  BM5105ADN   BM5105FDN
# BM5106ADN   BM5106ADW   BM5106FDN   BM5106FDW   BM5110ADN  BM5110ADW   BM5140ADN
# BM5200ADN   BM5200ADW   BM5205ADN   BM5205ADW   BM5208ADN  BM5208ADW   BM5230ADN
# BM5230ADW   BM5237ADN   BM5237ADW
#
# === BP Series ================================================================
#
# BP1800      BP1800W     BP2100      BP2100N     BP2100NW   BP2100W     BP2200
# BP2200N     BP2200NW    BP2200W     BP2300      BP2300NW   BP2300W     BP2301W
# BP2303W     BP2312NW    BP2316W     BP2318NW    BP2320NW   BP2336W     BP2345W
# BP2400      BP2400NW    BP2408      BP2408NW    BP2460     BP2460NW    BP4000DN
# BP4000DW    BP4005DN    BP4200D     BP4200DN    BP4200DW   BP4208D     BP4208DN
# BP4208DW    BP4210DN    BP4210DW    BP5100DN    BP5100DW   BP5101DN    BP5105DN
# BP5106DN    BP5106DW    BP5126DN    BP5140DN    BP5200DN   BP5200DW    BP5208DN
# BP5208DW    BP5230DN    BP5230DW    BP5237DN    BP5237DW
#
# === CM Series ================================================================
#
# CM1100      CM1100ADN   CM1100ADW   CM1100DN    CM1100DW   CM1100FDW   CM230ADN
# CM230ADW    CM230DN
#
# === CP Series ================================================================
#
# CP1100      CP1100DN    CP1100DW
#
# === L Series =================================================================
#
# L2300DW     L2350DW     L2710FDW
#
# === M Series =================================================================
#
# M118DW      M15DW       M29DW       M5100       M5200       M5300       M6200
# M6200N      M6200NW     M6200W      M6500       M6500N      M6500NW     M6500W
# M6503       M6503NW     M6507N      M6518NW     M6535NW     M6550       M6550N
# M6550NW     M6550W      M6568NW     M6595NW     M6600       M6600N      M6600NW
# M6600W      M6602W      M6700D      M6700DN     M6700DW     M6700DW+    M6708D
# M6708DN     M6708DW     M6710DW+    M6760D      M6760DW     M6760DW+    M6768DW
# M6770DW+    M6789DW+    M6800FDW    M6860FDN    M6860FDW    M7000D      M7000DW
# M7010DN     M7100D      M7100DN     M7100DW     M7100DW+    M7108DN     M7108DW
# M7140DN     M7160DW     M7160DW+    M7170DW     M7189DW+    M7200FD     M7200FDN
# M7200FDW    M7300FDN    M7300FDW    M7310DN     M7310DW     M7312DN     M7312DW
# M7318DN     M7318DW
#
# === MS Series ================================================================
#
# MS6000      MS6000NW    MS6550      MS6550NW    MS6600      MS6600NW
#
# === P Series =================================================================
#
# P1000       P2000       P2200       P2200NW     P2200W      P2210       P2210W
# P2300       P2300W      P2500       P2500N      P2500NW     P2500W      P2503
# P2503W      P2510       P2510W      P2517       P2518NW     P2535NW     P2550
# P2550N      P2595NW     P2600       P2600N      P2600NW     P2650       P2650N
# P3000       P3007D      P3007DW     P3010D      P3010DW     P3010DW+    P3020D
# P3020DWS    P3030D      P3060D      P3060DW     P3100       P3300       P3300DN
# P3300DW     P3300DW+    P3307DN     P3308DN     P3308DW     P3320D      P3320DWS
# P3340DN     P3500D      P3500DN     P3500DNT    P3500DW     P3508DN
#
# === S Series =================================================================
#
# S2000
#
# ==============================================================================

pkgname=pantum-universal-driver
pkgver=1.1.167
pkgrel=1
pkgdesc="Universal driver for Pantum printers"
arch=('x86_64')
url="https://global.pantum.com/support/"
license=('custom')
depends=('cups')
optdepends=('ipp-usb: for IPP over USB support')

# Auxiliary variables
_zipver="${pkgver//./_}"
_zipname="Pantum.Linux.Driver.V${_zipver}.zip"
_debname="pantum_${pkgver}-${pkgrel}_amd64.deb"
_foldername="Pantum Linux Driver V${pkgver}"

install=pantum-universal-driver.install

source=("${pkgname}-${pkgver}-${pkgrel}.zip::https://github.com/osguot/pantum-universal-driver/releases/download/release/${_zipname}")
sha256sums=('680a0b3534cd5411207b48382a2c2d266cb86c6c65d6ac0eec5430df00594e09')
noextract=("${pkgname}-${pkgver}-${pkgrel}.zip")

prepare() {
    # Extract DEB-file
    bsdtar -x -f "$srcdir/${pkgname}-${pkgver}-${pkgrel}.zip" "${_foldername}/Resources/${_debname}"

    # Move DEB-file
    mv "${_foldername}/Resources/${_debname}" .
}

package() {
    # Extract data.tar.xz from DEB-file
    ar p "${_debname}" data.tar.xz | tar -xJ -C "$pkgdir"

    # Remove unnecessary folder
    rm -rf "$pkgdir/${_foldername}"

    # Move libs from usr/lib/x86_64-linux-gnu to usr/lib
    if [ -d "$pkgdir/usr/lib/x86_64-linux-gnu" ]; then
        mkdir -p "$pkgdir/usr/lib"
        mv "$pkgdir/usr/lib/x86_64-linux-gnu"/* "$pkgdir/usr/lib/" 2>/dev/null || true
        rmdir "$pkgdir/usr/lib/x86_64-linux-gnu" 2>/dev/null || true
    fi

    # License stuff
    if [ -f "$pkgdir/usr/share/doc/pantum/copyright" ]; then
        install -Dm644 "$pkgdir/usr/share/doc/pantum/copyright" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
