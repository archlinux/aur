#Maintainer: C-Yassin <c.yassin.org@gmail.com>
pkgname=flameget
pkgver=1.0.0
pkgrel=1
pkgdesc="A GTK4 Download Manager wrapping Aria2, Curl, and YT-DLP"
arch=('any')
url="https://github.com/C-Yassin/flameget"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'python-flask'
    'gtk4'
    'libappindicator-gtk3'
    'aria2'
    'curl'
    'yt-dlp'
    'python-requests'
    'aria2p'
    'python-waitress'
)
makedepends=('git')

source=(
    "main.py"
    "tray.py"
    "downloader.py"
    "browser_context_menu_handler.py"
    "Toast.py"
    "server.py"
    "translations.json"
    "settings.json"
    "dark_style.css"
    "light_style.css"
    "custom_style.css"
    "flameget.svg"
    "flameget.desktop"
    "flameget.sh"
    "SaveManager.py"
    "xsi-application-exit-symbolic.svg"
    "xsi-view-reveal-symbolic.svg"
    "xsi-x-office-document-symbolic.svg"
    "xsi-view-refresh-symbolic.svg"
    "xsi-utilities-terminal-symbolic.svg"
    "xsi-user-trash-symbolic.svg"
    "xsi-preferences-symbolic.svg"
    "xsi-pan-up-symbolic.svg"
    "xsi-pan-down-symbolic.svg"
    "xsi-package-x-generic-symbolic.svg"
    "xsi-network-transmit-receive-symbolic.svg"
    "xsi-media-playback-stop-symbolic.svg"
    "xsi-media-playback-start-symbolic.svg"
    "xsi-media-playback-pause-symbolic.svg"
    "xsi-list-add-symbolic.svg"
    "xsi-input-keyboard-symbolic.svg"
    "xsi-help-browser-symbolic.svg"
    "xsi-graphics-symbolic.svg"
    "xsi-folder-videos-symbolic.svg"
    "xsi-folder-templates-symbolic.svg"
    "xsi-folder-symbolic.svg"
    "xsi-folder-open-symbolic.svg"
    "xsi-folder-music-symbolic.svg"
    "xsi-emblem-system-symbolic.svg"
    "xsi-emblem-synchronizing-symbolic.svg"
    "xsi-emblem-ok-symbolic.svg"
    "xsi-edit-select-all-symbolic.svg"
    "xsi-edit-copy-symbolic.svg"
    "xsi-document-new-symbolic.svg"
    "xsi-dialog-error-symbolic.svg"
)

sha256sums=('c837746fc7a0b34154855d464801d9d420996a4e952930e69f722090753349df'
            '633026dbb3782c993c5d3bcb27bc32306f6019c077d049daf2bef8ab1e103a29'
            '07a7a92338a6debe4c246589d1d0a77dec78d5146a65dc0911a105b07e294b70'
            '7fcf35b6a8e6f85781a81a747542d3a7df6c4d747fe9d87a3f24b1b128215074'
            '08a42525fb8aed7680bd22d1816c95890dab2d0bf4b132672c60079e697a2e32'
            '27108c60e2ef133e986a10f717a8555fc931c5a1a2612dcdc5c3321a74a179e6'
            '9d14ba08624282396e399602fba056be4459468e5ef0cf1df94b3d19967bbeac'
            'ffdacd8fae5b5a51d09311086b17a08bb873d2538b9e590beca5fe35d8183b6d'
            'ff9ad1651a99da834282c38bb2328162d9f45991720823b63599c245cc86a760'
            'e326ed7358c311131afafa5ea12a686a7a96b06e732062260037b4eca27974af'
            '31a20b182f1e037fc474f7d7beaae375dea21f02cf605de995ecebe377688bd7'
            '760f41ae9df477da38e40446933c4e930af66980fc1ad84f34948852ff71cadf'
            'e67da42e83ff6c13bf7aef7454acdba702a38732ade20f103c177b8a452d5b77'
            'b7589ea018f5c068a7c0eed41bde61fd6b705354dbd4a51d0f989c589068dae0'
            '62be36b3d538ff1485e0387f4fc3a083e062068928fccfd4780f18d8773d8f9a'
            'c1a0c1ca2e8f15fea2645466e6aaa6f5eb1a73fd3942dc001d0be4bcab39fd9f'
            'ec98bf51f293436514a688861fa1074d48ba8e4286efa8f1dae9c3715aeed362'
            '9f265bc483433503c43910d98938bf9b03de57a054b190aa9e543d800c173cbc'
            '43281dccb17fe4ef2d2fd459de33debf0fbd9294dac9275c0f047c9fe7d9ae5c'
            '136411618c7625e771cef9cdfab9c49606ae414d2dacd89bb4b3fe23c757b8b1'
            'a9fb4acd59659187fc705cc7bae5de6aa074da2d648731778025f5e69840ae95'
            '287a3f6c2dbdb1d90899680cf843a2b563b2f0025134bc23d99f23cdc1e2137c'
            '721e2c94656574da2bdd8cef7cce76e45ecaacebbffcaf7e1efc9aae8f536715'
            '49b07927082c327ab40a22bd901273f4a48f68bd72d463657432217aff23c89b'
            'fc604231cacbe481c02ede8f92f0b6374debcc0485895d1641dd999c406f676f'
            'ea8a62c72b83675161a7df27b17888434b832775c21bbe1ac358207eef5a1ca4'
            'de717251084ed2ee64ae328919a4d75ec13dcc620061c67143dab5bb68f0c9df'
            '6fc069b21b6b14a524afe7d3892da343eb2ca3fb4ef628a15b93826652ea05c0'
            '4756cbc2235a2f241696218f438cdc8c24b32f04a913a722c76988088d921625'
            '405a271977c2af2516e043dbe0422ae03c136ad15e10e431b58d8852e4e111cf'
            'f065743d82110e80d73f5fb0cd0268c791882013b4ba22d3752ad72cc4dbf170'
            'cd59f2092360c88a27c919c861da36ff36d86ec53e01a1b4f74d2ee3f19c66b4'
            'a184b2464e374e4a2cbe1e0ecac98e2cb2cd90bd2a406aef4e55adaf0e1a2adc'
            '187ea5995032967301e3c2ac03daf4d922a2e6aad436ee67c55f50d591e64751'
            '0a7c7a0bcdd1e994f48109fabc30c0a32b32e19e7496580484e12f8fe7ade9c6'
            'd5fbf420bca60ec27f41296e00d517cd66bbbeb3622a89643c70808dfa204c6f'
            'caa94690a91374c8ccbf97f41d6cdcb08f33f0ad2a5e5e527a46c6e1ec0687c3'
            '706d76d93ee8c91e0e9623c923eaf08f8d42369873e028a6e7f63e685dbdae10'
            '30e76c3fc3bd2cd0c20cfc5eefe8078789df9f6072228dcdbc3de18288878c01'
            '79f266d397263237d48d302213a4a7728690de91648cd3b364a24c5f722cc601'
            '2f316af0449a986b2193b63083d2b4e083a2dc05f2c50da8b46f2baebb277535'
            '1c6d419e8398fb61aa76fe2f321b971a90cc9492eb359e50c03f9c0effd8dcc6'
            '7aa32044a367ce62d42332ac5b3b2517ddc87fbe9798a091f191df6c86481579'
            '3925f99a0a2ff858b8ecc209e59fbf24625baa739eef9c70721d7ea35481ac81'
            '9ae9275bada87b8f1328664d6ec93710a9420fb6dbe945b0868b9a42feebe95d')

package() {
    install -d "$pkgdir/usr/lib/$pkgname"
    install -d "$pkgdir/usr/lib/$pkgname/icons"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"

    cd "$srcdir"
    
    for file in *; do
        [ -f "$file" ] || continue
        
        case "$file" in
            xsi-*.svg)
                install -m644 "$file" "$pkgdir/usr/lib/$pkgname/icons/" 
                ;;
                
            *.py|*.json|*.css)
                install -m644 "$file" "$pkgdir/usr/lib/$pkgname/"
                ;;
                
            flameget.sh)
                install -m755 "$file" "$pkgdir/usr/bin/flameget"
                ;;
                
            *.desktop)
                install -m644 "$file" "$pkgdir/usr/share/applications/"
                ;;
                
            flameget.svg)
                install -m644 "$file" "$pkgdir/usr/share/icons/hicolor/scalable/apps/flameget.svg"
                ;;
        esac
    done
}
