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
# BM2460      BM2460A     BM2460ANW   BM2460NW    BM4000ADN  BM4000ADW   BM4000FDN
# BM4000FDW   BM4005ADN   BM4005FDN   BM4100FDN   BM4100FDW  BM4200AD    BM4200ADN
# BM4200ADW   BM4200D     BM4200DN    BM4200DW    BM4208AD   BM4208ADN   BM4208D
# BM4208DN    BM4208DW    BM4210ADN   BM4210ADW   BM4210DW   BM4240ADW   BM4248ADW
# BM4300ADW   BM4308ADW   BM4310ADN   BM4310ADW   BM5100ADN  BM5100ADW   BM5100FDN
# BM5100FDW   BM5105ADN   BM5105FDN   BM5106ADN   BM5106ADW  BM5106FDN   BM5106FDW
# BM5110ADN   BM5110ADW   BM5200ADN   BM5200ADW   BM5205ADN  BM5205ADW   BM5208ADN
# BM5208ADW   BM5210ADN   BM5210ADW   BM5218ADN   BM5218ADW  BM5220ADN   BM5220ADW
# BM5225ADN   BM5225ADW   BM5230ADN   BM5230ADW   BM5237ADN  BM5237ADW   BM5285ADN
# BM5300ADN   BM5300ADW
#
# === BP Series ================================================================
#
# BP1800      BP1800W     BP2100      BP2100N     BP2100NW   BP2100W     BP2200
# BP2200N     BP2200NW    BP2200W     BP2300      BP2300NW   BP2300W     BP2301W
# BP2303W     BP2312NW    BP2316W     BP2318NW    BP2320NW   BP2336W     BP2345W
# BP2400      BP2400NW    BP2460      BP2460NW    BP4000DN
# BP4000DW    BP4005DN    BP4200D     BP4200DN    BP4200DW   BP4208D     BP4208DN
# BP4208DW    BP4210DN    BP4210DW    BP5100DN    BP5100DW   BP5101DN    BP5105DN
# BP5106DN    BP5106DW    BP5126DN    BP5200D     BP5200DN   BP5200DW    BP5208DN
# BP5208DW    BP5230DN    BP5230DW    BP5237DN    BP5237DW
#
# === CM Series ================================================================
#
# CM1100      CM1100ADN   CM1100ADW   CM1100DN    CM1100DW   CM1100FDW
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
# M6200N      M6200NW     M6200W      M6500       M6500N      M6500NW     M6500NW+
# M6503       M6503NW     M6507N      M6518NW     M6535NW     M6550       M6550N
# M6550NW     M6550NW+    M6550W      M6568NW     M6595NW     M6600       M6600N
# M6600NW
# M6600W      M6602W      M6700D      M6700DN     M6700DW     M6700DW+    M6708D
# M6708DN     M6708DW     M6710DW+    M6760D      M6760DW     M6760DW+    M6768DW
# M6770DW+    M6789DW+    M6800FDW    M6860FDN    M6860FDW    M7000D      M7000DW
# M7010DN     M7100D      M7100DN     M7100DW     M7100DW+    M7108DN     M7108DW
# M7160DW     M7160DW+    M7170DW     M7189DW+    M7200FD     M7200FDN
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
# P2300       P2300W      P2500       P2500N      P2500NW     P2500W      P2500W+
# P2503       P2503W      P2510       P2510W      P2517       P2518NW     P2535NW
# P2550N      P2595NW     P2600       P2600N      P2600NW     P2650       P2650N
# P3000       P3007D      P3007DW     P3010D      P3010DW     P3010DW+    P3020D
# P3020DWS    P3030D      P3060D      P3060DW     P3100       P3300       P3300DN
# P3300DW     P3300DW+    P3307DN     P3308DN     P3308DW     P3320D      P3320DWS
# P3500D      P3500DN     P3500DNT    P3500DW     P3508DN
#
# === S Series =================================================================
#
# S2000
#
# ==============================================================================

pkgname=pantum-universal-driver
pkgver=1.1.186
pkgrel=4
pkgdesc="Universal printer and scanner driver for Pantum devices"
arch=('x86_64')
url="https://global.pantum.com/support/"
license=('LicenseRef-Pantum')
depends=(
    'cups'
    'libcups'
    'cups-filters'
    'ghostscript'
    'sane'
    'libusb'
    'libjpeg-turbo'
    'zlib'
    'libgcc'
    'libstdc++'
)
provides=("pantum-driver=${pkgver}")
conflicts=('pantum-driver')
options=('!strip')

# Auxiliary variables
_zipver="${pkgver//./_}"
_debrel=1
_debname="pantum_${pkgver}-${_debrel}_amd64.deb"
_foldername="Pantum Linux Driver V${pkgver}"
_download_url='https://drivers.pantum.in/userfiles/files/download'
_download_path='%E9%A9%B1%E5%8A%A8%E6%96%87%E4%BB%B6/4020/%E6%AC%A7%E6%B4%B2%E5%AD%90%E7%AB%99%E9%80%82%E9%85%8D%E8%8D%B7%E5%85%B0%E8%AF%AD20260520'

backup=(
    'etc/sane.d/pantum6500.conf'
    'etc/sane.d/pantum_bm2400.conf'
    'etc/sane.d/pantum_bm4200.conf'
    'etc/sane.d/pantum_bm5200.conf'
    'etc/sane.d/pantum_bm5230.conf'
    'etc/sane.d/pantum_mfp.conf'
    'etc/sane.d/dll.d/pantum6500'
    'etc/sane.d/dll.d/pantum_bm2400'
    'etc/sane.d/dll.d/pantum_bm4200'
    'etc/sane.d/dll.d/pantum_bm5200'
    'etc/sane.d/dll.d/pantum_bm5230'
    'etc/sane.d/dll.d/pantum_mfp'
)

source=(
    "${pkgname}-${pkgver}.zip::${_download_url}/${_download_path}/Pantum%20Linux%20Driver%20V${_zipver}.zip"
    'pantum-ipp-usb.conf'
    'fix-pantum-ppd.awk'
)
sha256sums=(
    'ce28c1f42e3c6a642cd49af3d6827b63ad4f0484b2151f0594470a1746828a45'
    'b24a64ae11b9e3b5eb1e5da608b38592b8131644be48e2e8d75d9491750aa6f5'
    '262d88bd34188a401fae2599ed8ac255236cec3b7d86fd22618fcf0f46a11f4e'
)
noextract=("${pkgname}-${pkgver}.zip")

prepare() {
    bsdtar -xOf "$srcdir/${pkgname}-${pkgver}.zip" \
        "${_foldername}/Resources/${_debname}" > "${_debname}"
    bsdtar -xOf "$srcdir/${pkgname}-${pkgver}.zip" \
        "${_foldername}/Resources/locale/en_US.UTF-8/license.txt" > EULA
    bsdtar -xOf "$srcdir/${pkgname}-${pkgver}.zip" \
        "${_foldername}/Resources/locale/en_US.UTF-8/privacy.txt" > PRIVACY
}

package() {
    bsdtar -xOf "${_debname}" data.tar.xz | \
        bsdtar --no-same-owner -xpf - -C "$pkgdir"

    # Debian ships duplicate SANE files in /usr/local, which packages must not own.
    rm -rf "$pkgdir/usr/local"

    # Use Arch's native SANE library directory.
    install -d "$pkgdir/usr/lib/sane"
    mv "$pkgdir/usr/lib/x86_64-linux-gnu/sane/"* "$pkgdir/usr/lib/sane/"
    rmdir "$pkgdir/usr/lib/x86_64-linux-gnu/sane" \
        "$pkgdir/usr/lib/x86_64-linux-gnu"

    # Vendor udev rules belong in /usr, not in the administrator-owned /etc.
    install -d "$pkgdir/usr/lib/udev/rules.d"
    mv "$pkgdir/etc/udev/rules.d/"*.rules "$pkgdir/usr/lib/udev/rules.d/"
    rmdir "$pkgdir/etc/udev/rules.d" "$pkgdir/etc/udev"

    # Do not make USB devices world-writable. Members of lp retain access, and
    # libsane_matched lets Arch's 70-uaccess.rules grant an ACL to active users.
    sed -i \
        -e 's/MODE="0666", OWNER="root", GROUP="lp"/GROUP="lp", MODE="0664"/g' \
        -e '/^LABEL="mud_rules_end"$/d' \
        "$pkgdir/usr/lib/udev/rules.d/"*.rules

    # The bundled ipp-usb fork conflicts with Arch's supported ipp-usb package.
    rm -rf "$pkgdir/opt/pantum/ippfilter" "$pkgdir/opt/pantum/{lib}"
    install -Dm644 "$srcdir/pantum-ipp-usb.conf" \
        "$pkgdir/usr/share/ipp-usb/quirks/pantum.conf"

    # V1.1.186 PPDs still reference these filters, omitted from the vendor DEB.
    ln -s rastertoPantum "$pkgdir/usr/lib/cups/filter/BM2400"
    ln -s rastertoPantum "$pkgdir/usr/lib/cups/filter/BP2400"

    # Normalize invalid JCL UI blocks and let Pantum's PDF filters consume
    # standard PDF directly, avoiding a failing bannertopdf/pdftopdf chain.
    local ppd ppd_count=0 original_valid
    while IFS= read -r -d '' ppd; do
        ppd_count=$((ppd_count + 1))
        original_valid=false
        if cupstestppd -q -I filters -W none "$ppd"; then
            original_valid=true
        fi

        awk -f "$srcdir/fix-pantum-ppd.awk" "$ppd" > "$ppd.fixed"

        if $original_valid &&
            ! cupstestppd -q -I filters -W none "$ppd.fixed"; then
            printf 'PPD normalization broke a valid file: %s\n' \
                "${ppd#$pkgdir/}" >&2
            return 1
        fi

        awk -f "$srcdir/fix-pantum-ppd.awk" "$ppd.fixed" \
            > "$ppd.checked"
        if ! cmp -s "$ppd.fixed" "$ppd.checked"; then
            printf 'PPD normalization is not idempotent: %s\n' \
                "${ppd#$pkgdir/}" >&2
            return 1
        fi

        rm "$ppd.checked"
        mv "$ppd.fixed" "$ppd"
    done < <(find "$pkgdir/usr/share/cups/model/Pantum" -type f \
        -name '*.ppd' -print0)

    if ((ppd_count == 0)); then
        printf '%s\n' 'No Pantum PPD files found in the vendor package' >&2
        return 1
    fi

    if grep -R -E '^\*cupsFilter:.*application/vnd\.cups-pdf.*(ptps|phase2filter)' \
        "$pkgdir/usr/share/cups/model/Pantum" >/dev/null; then
        printf '%s\n' 'Unnormalized Pantum PDF filter declarations remain' >&2
        return 1
    fi

    install -Dm644 EULA "$pkgdir/usr/share/licenses/$pkgname/EULA"
    install -Dm644 PRIVACY "$pkgdir/usr/share/licenses/$pkgname/PRIVACY"
    install -Dm644 "$pkgdir/usr/share/doc/pantum/copyright" \
        "$pkgdir/usr/share/licenses/$pkgname/copyright"
    install -Dm644 "$pkgdir/usr/share/doc/pantum/changelog.gz" \
        "$pkgdir/usr/share/doc/$pkgname/changelog.gz"
    rm -rf "$pkgdir/usr/share/doc/pantum"
}
