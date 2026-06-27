# Maintainer: Tobias Kunze <r@rixx.de>

# This package installs the complete collection of freeware fonts published
# by Peter Wiegel on https://www.peter-wiegel.de/fonts2.html which is largely
# fonts he only published/cleaned up, but did not design himself. Please
# refer to the ttf-peter-wiegel package for his own fonts.

# Details:
# - Each font is placed in a subdirectory under /usr/share/fonts/peter-wiegel/
# - Only .ttf fonts are installed, leaving out Titillium which is readily available elsewhere
# - If Inkscape is installed, a font collection is installed to the user's
#   Inkscape profile
# - This package sets license=('custom') as licensing is mixed; appropriate LICENSE
#   notes are installed in the individual font directories.

pkgname=ttf-peter-wiegel-ext
pkgver=20260626
pkgrel=1
pkgdesc="Extended collection of fonts by Peter Wiegel"
arch=('any')
url="https://www.peter-wiegel.de/fonts2.html"
license=('custom')
depends=('fontconfig')
makedepends=('fontconfig')
optdepends=('inkscape: use the bundled Peter Wiegel Ext font collection')
_baseurl="https://www.peter-wiegel.de/Fonts"

_fonts=(
         'AlbertTextUNZ1.zip'
         'AnglicanText UNZ1L.zip'
         'BalladeUNZ1-Bold.zip'
         'BreitkopfFrakturUNZ1L.zip'
         'Chunkfive Ex.zip'
         'ChursaechsischeFrakturUNZ1.zip'
         'CoelnischeCurrentFrakturOsFUNZ1.zip'
         'Duerergotisch UNZ.zip'
         'FetteDeutscheSchriftUNZ1L.zip'
         'FetteThannhaeuserUNZ1.zip'
         'GL-GermanCurU1AY.zip'
         'GL_Nummernschild.zip'
         'GanzGrobeGotischUNZ1A.zip'
         'Gotenburg-B_UNZ1L.zip'
         'GothenburgFrakturUMZ1.zip'
         'HansagotischUNZ1L.zip'
         'HeadlinetextUNZ1L.zip'
         'Hermann-Gotisch-UNZ1L.zip'
         'HumboldtFrakturUNZ1L.zip'
         'Kanzlei UNZ1.zip'
         'KoenigsbergerUNZ1L.zip'
         'LohengrinUNZ1.zip'
         'ModerneFrakturUNZ1.zip'
         'NeueErnst55.zip'
         'NeueTheuerdankFrakturUNZ1A.zip'
         'Paganini_UNZ1.zip'
         'Plakat-FrakturUNZ1L.zip'
         'RedivivaUNZ1.zip'
         'SchmaleAnzeigenschriftUNZ1L.zip'
         'SchulfibelLine2.zip'
         'Sebaldus-Gotisch-UNZ1L.zip'
         'TannenbergFettUNZ1.zip'
         'TypographerFrakturUNZ1.zip'
         'TypographerGotischAUNZ1.zip'
         'TypographerRotundaUNZ1.zip'
         'TypographerTexturUNZ1.zip'
         'U1.zip'
         'Walbaum-FrakturUNZ1.zip'
         'WerbedeutschUNZ1L.zip'
         'WieynckFraktur-UNZ1L.zip'
         'ZentenarFrakturUNZ1L.zip'
)

source=()
noextract=()
for _f in "${_fonts[@]}"; do
    source+=("${_f// /_}::${_baseurl}/${_f// /%20}")
    noextract+=("${_f// /_}")
done
unset _f

sha256sums=(
             'ee1ab72e33a237ebb3cfeec20f33355d5b96596bb82010aff39786b62ee7a284'
             '8e966b8c33172d65f19158f9151b5ea537ac181531a89b59e83e12782487df64'
             '1dad0ecad57464ecdc1193b555e31173fb06b0014748ac89113e24bf13a53e11'
             'bdbce702476ad48f80a13b36f34cfa0bebe5aa62718f71c7c1dee72a541ce4a8'
             '075b26f9abeb3999e6181d7d9a4d6a504d2a07ef8ee865979e027c479f91783c'
             'cbf3c97288b2d92e1956e1df142cadb8cb9dda270b2b6efcf2ea76cb934a273f'
             'c5ca044801bdaff770cfbef032f202e6fc6279cec68f016b1334472dfacc3689'
             'd8cc1db024cc7780ad24977a2df2649d69aacb53dfa0d044ee6804bec3980d28'
             '18ac633404eca263771f6803e9980900745d36b29992fe7db477a83ae92436d7'
             '265fa9c40bcc3ed74a0a5fc908ffa7072ee21ce0b0040055a85d1746623ef82a'
             'd6131ab3fd0005e7e12c63003263efa970cb56463c4944803e4fc1bc80dfa947'
             'b474502461b3abf748cded88a8c90e849bcbb52dc0da784e7bfee6e582eaae1d'
             'a4aaa1f3fc5d7ce63c11231f1bc59fa926de3e66417e9fd9e6d9d4bde6688169'
             '23b0dd7f1b24ab24630a4bc1f33f93925975e459d840e8606cbbb2d3b221d5ef'
             'caa342315869561744d0dc3668d969dad38b7712311807637967dbc65f80e2f3'
             'f2b35a1d37e3a3008c44cbb904e3386a9ad8431eb4ba17b0f110eb4da4b9c080'
             '42e57a7cf8b4acd8977bf55104762696459d3a8947012ba6567e30e79ada2033'
             'edbf9ce45ddb0e21b8d08d0050ff291e7f92b6ada2499eb70857824876066447'
             '96897f8eaddd897dc62968de67af4087e70b31453c4001c8f34914125e5b128c'
             'd8c2998755c72685fa2828edb8704240f2e3cfaeee11189d6690894959bed506'
             'b5fef43a8513289a247055f5052f068d0692dbc1de75bd9674d944ef22f52e88'
             '86f1255497cda55a6c88b7eeed6f4206aa252f18207b739907145d11109f9e0c'
             '170cd591bbaa4d7e3b93fba1a14fef2624057d70aff9a8805bc68e5a0690389e'
             'b9a74ddc7166cb4642abd22b9b94a5ed179b0d6133b00564533d089c5af67db6'
             '3cbe3a0cb0424963150fa95371f316f8bd7fb71e2e06b88535d3a1d31cac830a'
             '140e7b1162699f52a51fce2451d22387a03a938c536bd010b0e16657b8cfcca5'
             'bc8217be41afb48783537399030c8cdc18cec015f80a9ebfff02b54957472681'
             '656052ae3d914ae2fc23b899e8d661315145fb58c51767613c8555d8851432ce'
             '4bd8fec94b550d143f0cfee151ab1499fd4d81684c91f69c0d4b8a82e20bb673'
             '0b661adb66cd1960b7388b0797a67280a7a3d6d89d5bb1cb2acbd991872e4018'
             'c69be1df353904c4a5d80297b373b26de6ee86c52acc15305418f0e5807d7bd8'
             '264db857c96aa309f9c9c6b87072ce452c1c7a1817614ba5a07807dd2d5483c0'
             '851e158d580f3bc8924f003692e60cafcc1237a3a93762a06244892073d61206'
             '34da7f0d83e951279f844d4e19dc7fdb3341df572de7a3ffa7a124ea41f0a1db'
             'fcbdcd9bae98910447745df4a1e3f1c9127ec4d7649da07fe045c6f73aeb5876'
             '80171e86cfcb8dbcafeb19cf58a295720ca61931c10a30e9dbffbf3f8e4c4f89'
             'cee989899cef090e7ef3c504060bf78980e044caf731f54094a7871633a27cd1'
             '9039e69fd5325aa110e09d9199dac413b2df54e4a1671cb3dfb3a5c0e709e371'
             '9f724ed50f945a77907cc418f798b1d83cbdefff2ee5e087f915ce9dcb6e49b3'
             '330b92ea0e4b554718cdc07a0210c5b646959310e1f3881b319154d3577bfe6c'
             '6044b87a3272927215990ac59ab492232fc31cbb0852159cefa6d9bf8f7ddaf4'
)

package() {
    local destbase="${pkgdir}/usr/share/fonts/peter-wiegel-ext"
    local f lf name dest file base newbase dir

    for f in "${_fonts[@]}"; do
        lf="${f// /_}"
        name="${lf%.zip}"
        dest="${destbase}/${name}"
        install -d "${dest}"
        bsdtar -xf "${srcdir}/${lf}" -C "${dest}"
        find "${dest}" -type f ! -iname '*.ttf' -delete

        # A few font archives store file names in the legacy DOS codepage CP437
        # rather than UTF-8, which can break in non-C locale build envs so we
        # transliterate the names to ASCII. (Only changes the file name, not
        # the font name).
        while IFS= read -r -d '' file; do
            base="${file##*/}"
            if ! printf '%s' "${base}" | iconv -f UTF-8 -t UTF-8 >/dev/null 2>&1; then
                dir="${file%/*}"
                newbase="$(printf '%s' "${base}" | iconv -f CP437 -t ASCII//TRANSLIT)"
                mv -- "${file}" "${dir}/${newbase}"
            fi
        done < <(find "${dest}" -depth -type f -print0)

        find "${dest}" -mindepth 1 -type d -empty -delete
    done

    # License: terms are mixed and partly non-free, so document them and ship the
    # one bundled OFL copy (covers the OFL-licensed members of the collection).
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'LICENSE'
CAT Fonts -- "Fremde Fonts" (extended collection) by Peter Wiegel
https://www.peter-wiegel.de/fonts2.html

These fonts are reworkings/digitisations of typefaces that were not (entirely)
created by Peter Wiegel. Per the author, every font in this collection may be
used free of charge for ANY purpose, including commercial use.

Licensing is mixed:
  * Most fonts are released under a free license -- the GNU GPL with Font
    Exception and/or the SIL Open Font License (OFL). A copy of the OFL is
    installed alongside this note as OFL.txt.
  * The fully-programmed OpenType "Funktionsschrift" variants are based on
    OpenType fonts from Ligafaktur.de (used with permission). These embed
    proprietary code and are therefore NOT under a free license; free use,
    including commercial use, is nonetheless expressly granted by the author.

Some fonts are auto-digitised from historical templates and may be unfinished
(incomplete character sets).

For the authoritative and current terms see https://www.peter-wiegel.de/
LICENSE
    bsdtar -xOf "${srcdir}/Chunkfive_Ex.zip" 'SIL Open Font License 1.1.txt' \
        > "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt" 2>/dev/null || true

    local collection="${srcdir}/Peter Wiegel Ext.txt"
    find "${destbase}" -type f -iname '*.ttf' -print0 \
        | xargs -0 -r -n1 fc-scan --format '%{family[0]}\n' 2>/dev/null \
        | perl -CSD -ne 'chomp; next if /^\s*$/; print "$_\n" unless /[^\x00-\x{024F}]/' \
        | LC_ALL=C sort -u > "${collection}"
    install -Dm644 "${collection}" "${pkgdir}/usr/share/${pkgname}/Peter Wiegel Ext.txt"
    # If Inkscape is installed, add the collection to the user's Inkscape.
    if pacman -Qq inkscape &>/dev/null && [[ -n "${HOME}" ]]; then
        install -Dm644 "${collection}" \
            "${pkgdir}${HOME}/.config/inkscape/fontcollections/Peter Wiegel Ext.txt"
    fi
}
