#Maintainer: C-Yassin <c.yassin.org@gmail.com>
pkgname=flameget
pkgver=1.0.0
pkgrel=1
pkgdesc="A GTK4 Download Manager wrapping Aria2, Curl, and YT-DLP"
arch=('any')
url="https://github.com/C-Yassin/FlameGet"
license=('MIT' 'LGPL3')
depends=(
    'python'
    'python-gobject'
    'python-flask'
    'gtk4'
    'libappindicator-gtk3'
    'aria2'
    'python-pycurl'
    'yt-dlp'
    'python-requests'
    'python-waitress'
    'aria2p'
    'ffmpeg'
)
makedepends=('git')

source=(
    "main.py"
    "tray.py"
    "downloader.py"
    "browser_context_menu_handler.py"
    "Toast.py"
    "translations.json"
    "dark_style.css"
    "light_style.css"
    "custom_style.css"
    "flameget.svg"
    "flameget.desktop"
    "flameget.sh"
    "SaveManager.py"
    'FireAddOns.py'
    "build.sh"
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
    "xsi-emblem-favorite-symbolic.svg"
    "xsi-dialog-information-symbolic.svg"
    "xsi-executable-symbolic.svg"
    "xsi-github-symbolic.svg"
    "xsi-sign-info-symbolic.svg"
    "xsi-text-x-generic-symbolic.svg"
    "xsi-folder-pictures-symbolic.svg"
    "xsi-window-close-symbolic.svg"
    "flameget_about_dialog.png"
    "io.github.C_Yassin.FlameGet.metainfo.xml"
)

sha256sums=('f48b0615e1fdd8e3f28fc56c71fa930bb24f59d754d64fec8be3d5252668d7d6'
            '0493a516e031eb46449e53e63abffcd57f22dc60dd1d726bc2dd27e037a9faa3'
            'da64f50fa8fb2faa476b610c1c58285046ec0d256f58aa4fd8de66ecd30c328c'
            '99cbb9bdd6ceccf75a939f43a0a325dece3ea8e56f0dc03fa4832a2bb7726bd9'
            'd4ba9a8f986d69f512dbfdbf594f51112b31ce1df16a9e481b70df5107544319'
            '13bacdaa507383dbac332316d3998884e05e3f6868480529b0ab381b013285ac'
            'cea7e5f5046ebec31573ff1a9645a6f119cb7f676e1c6bd6187de484df6fe3fc'
            'f592a9ed655c99198beae352c46e6980b50a2c572ee124b991a56cc9e079a2db'
            '152c85a349918671498e2515ac24503bed95626da514a70dd64a18d7646d6ca6'
            '760f41ae9df477da38e40446933c4e930af66980fc1ad84f34948852ff71cadf'
            '801714ce164699baae490aae1abba2c52ac4b4459c196b6dab7e6e1949fcba44'
            'b7589ea018f5c068a7c0eed41bde61fd6b705354dbd4a51d0f989c589068dae0'
            'f6b781f67908e9d02223eb9730995a8cc91393c3f6b0417fb3d98646353a8689'
            '7085d23fdc10f85e0c00f9624464a1dd2f0b929695b736b07b8e159e7e07d729'
            'c4d7aea24957d76f67c819721d2c892316b276b5503a75b647f745e59153c600'
            'ec98bf51f293436514a688861fa1074d48ba8e4286efa8f1dae9c3715aeed362'
            '60d7586fe076ea552b2e5d07490d73f91c23f37ae75fa400f0ba55724e2c1f53'
            'e87598352bb5863da8eda0768a2093628bbbc5dcc11b3193738f1bd75b6c3c20'
            'e0628a25fb58251b007c770705d017011cbfa49fdc94c5c029b2cb76de6dc0ac'
            '1563b60fe9c54cd6e9217a330021e018f9ffb99067c6cd499a82b9bace74eb42'
            'ee4ee2061d0573ce453497c096660deb06bac970d08a83efc8cbc1320d43fc0f'
            '22193faf86cdce23d7a736ea646341efbea2177d6131691f899f7502829f65a3'
            'f5586605c820b0031493f6a165817e0687889be554ae8e33841caf6ea6ef11ec'
            '422c5db7d1350cc72fea28d6af14127d6db4b1181ffd6d2529093a48816b116d'
            '85166b932c0b6937a6208b764ca11f6a34a8b04dfb2cfb8be97ace6c0dd1336c'
            'e7c114e7618a117fd6d5b6bc7b16a01e25f5bc0d34feb1cfd894db913ab8bd83'
            '35982fb8761cc37bd1ff46e490a908968323ed0a01440992502f4b3e954469b4'
            '8e1cdf3e67b0a8bf6fb81910217168fe8a784d0b5df67790392c170c4b2fab7c'
            '1db405b6413844a868fe8cc676ae4f26826a886dc1dbea28e2bc39ac5ee768ee'
            'f4aa71ca66865afb7de1b96e59e8f56bfc8d97e694d8dae372a9283309de5290'
            '93ee7fb132733a3240f6cd02b2ad4f654fb98bb98400601b62acfc488412818e'
            '905c5694ae8eecac0e06053c80756d400faf994411531df0708d2f9cd8918077'
            '35a74f28cee229942e0dc43ae1925bca898b1218aa6ee8252eaaa1e12476980f'
            '9b7e63475a838c66c7fa349b707e571a0b6ec2cca410d450537b44f8b216b5ec'
            'ed9218d1e417001a043c68ddee34ed9616efa2106304b469dfec353697aa4df9'
            '2e611df9eaa8345b777ed9fe80574a9a9807df4e238b97563a72565334a96a9a'
            '453c0b8da988f57bf88f0d8a8102f26394736f2b12187a5e2a85024a1bbc1ecc'
            '700d2957f73e34afb672273580fb388dfd62447c0ddc38b6c6d00496af354de3'
            '72b5ae511b09b77abba8097d17f19dfaa1dc0edee42a9a8ad862b75e27db532a'
            '083f98a3ba13e1ee90b4b1fb2df6dabaaa2ca4ff18888a7b2140375e8b7838e4'
            'dd61f55020ffe203776b1576ea576810878cd697ff18c3d1c82da89957bdbd24'
            'a38a30f0f8b65dd5835124a700a88271450445969eef85eff5938bb8bdfbe7f1'
            'ffdf96fa6a84d0bb760a4d38ade9c84b3edf74f679c9bbd62bdfcf3710d06fc8'
            '8d1fc13fdac323d5a9f0f00a3011e92fa2f56286498f2043f569cf490a20153e'
            '296cfaaba89a9842d6675a2b11abc4173e42b7b007dd2b9c345eb7bca1ab8306'
            '508d6a331ce6a1711b6f6c09d8f933ea8266e0b09b43cac93710f44d1849cfbc'
            'b04c04e7a48ef6fa9445b5cc344e9117d48242ac2280521208ef892972791e84'
            '241aa2df9d22c82a1e57b37355671cf9a685d0e4322bdd6c259eb1f5b2882800'
            'e0c3365abd3cef09e0a066ef44091c40609db842e25dd80d4adc7e8618c734ee'
            'ae2d01e62986ec9b0dd93458adbb2c9b8c7025d19761ab7ff49837b999f0ba38'
            '67e6005ebeae35bb9e9886330860817a5e8f297eb35c2d9493cff298dc67068e'
            '8c409bce0493b22a91eaa21d228cfc5ec115f9626d968422171f86c09ec1e239'
            '6fc5317656f716553e0fc04d6ede5efd9b793684f50cdf62eb89c13dfdd5abdf')

package() {
    install -d "$pkgdir/usr/lib/$pkgname"
    install -d "$pkgdir/usr/lib/$pkgname/icons"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -d "$pkgdir/usr/share/metainfo"
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

            *.metainfo.xml)
                install -m644 "$file" "$pkgdir/usr/share/metainfo/"
                ;;
        esac
    done
}
