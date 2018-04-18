# Maintainer: Prasad Kumar
# Contributor: Philip Müller <philm@manjaro.org>
pkgname=ms-office-online
pkgver=2018.04
pkgrel=2
pkgdesc="Microsoft Office Suite Online"
arch=('any')
url="https://www.office.com/"
license=('custom')
depends=('jade-application-kit-git') #minimum of jade-application-kit v0.36 is required and is currently provided by git
source=('Excel.desktop'
        'Excel.png'
        'MSOffice.desktop'
	'ms-office-online'
        'MSOffice.png'
        'OneNote.desktop'
        'OneNote.png'
        'Outlook.desktop'
        'Outlook.png'
        'PowerPoint.desktop'
        'PowerPoint.png'
        'settings.json'
        'WebSkype.desktop'
        'WebSkype.png'
        'Word.desktop'
        'Word.png')
sha512sums=('330f57c0f708f61eff71afaa4c2016853437f378c4a907638b379c6d8825ec0775ce7687309fbe1942b950dc4fde4ddb899b4f1cbe1ec5478848e657c0f2d9de'
	    '6fecce6d345d782f89c7b125e107548590775c21b81456d9e789ffcc1bb61640bcd51287939bf26ad71d73da78a2a12cfb7d75ce3e866ac91b489fcfe20618b9'
	    'd1806d9fe7fbe12bda780d0b2827fb0ba0c93696e10d7b9beb1078b0944f9b327acf8423c842eb61803bc955f9d3923b24eb85b053e416729a246f141504682a'
	    'a96c27e79d8e5d1fe0f51e4668e03122c55fabb8f2bb7884e693a721275b9207cc54ee616eb9b70d55caa0ffbecd65066b45481d28476062d96e58ee22c92ecc'
	    'e497521933f90306307a03fb9738f0dc501082b923592b26f6b3b31970b83a97007e3e63490a31e4b2e4aec1ea466440ff5ce26e6064de06bb9ffbb45b932482'
	    '6bf4b6ac6df32bbcdca2558f4b5bd3a82524cd5dfb471675c0547bb6971f1c00e2882b6801176ca1fa2eb186dc9c0d618ee3910d0a48a6aed6b9dc48d5871f3a'
	    '8df959cb21bdde875ca1334af474d296d71bf43042d92b4f19e6f03b4ee186b9b99309b3926b01e460a69bd5869c4a6bdea1008fafda92db4d88e81914dbe619'
	    'ad238a8d0c4136dd98dbf06f6e47a88acb226b99d1e503a11eb1935ecaefa4d26cc325a4d5a622eb929cc4fc5e1cdf2c29c1c13df9d2b2bccd9de9565d707d05'
	    'd04f4ebbd3b05f6eca30df6e468a68f3e4972b50f58585699ac49d684e533e72f05704b666c2a3c573cbe9aaecc0519a78b872f67ad9c7ed25999fe5b6a475bd'
	    'd8bb50964fe1e46b66089531a24285e994cd3fcb553c6dce09dfa045879190361c1ecee98fdf979d3d1f6939864169413220e7adb4df6b997f22de75346cf9fa'
	    'c28940c7f89241b85ea1117960297ea90d7921e0013a809f7442f1b311e7e764b536b6ae19263d5580d9de130ee7d734b9dc9fcdfe0fe612f2be8f675be6a6d0'
	    'c058c96fc9dbd020aed9b9076c3c846111fc001f9955ad6554cf5f9788a9348935f4699bbe8fcf720af3daf6f472bb892061d25d9dbced8eef75be2eee4b8a4c'
	    '8e05505d5759f3e5fc73e02b0882a7c9781e3ceaaa68d1480ee13f492f4b8f517f3ed5a574dfefffa34cd58f5614b8981508665c6a4880fdcffedbdf8f69775d'
	    '704f86a2b61dbb9bf578c13457c907b45b49a4ae6ca9d9ff7568d5527515f13664092552d1fbe3a4765151cff1cb6517e2f3c928f3e89ae347e8020b660c0898'
	    '0864a208b2f8752a430f247aad4a6b7509e09678692559f8ef69eee3ce1c378e4d1233c9ed442819e8be4617d9b4f41c8300d290d202f86d6011100b22a0bb63'
	    '87c94eed8bbbcbe5625ac75135e825a9b1509276877bff0ac1f610269bb371cb5bac268b5bb5e07b6ad0629f7007b1936b04faea0a6c7ca080c26b631a986d40')

package() {
    # Install ms-office-online launcher
    install -Dm755 "${srcdir}"/ms-office-online "${pkgdir}"/usr/share/ms-office/msoffice/ms-office-online
    install -Dm755 "${srcdir}"/ms-office-online "${pkgdir}"/usr/share/ms-office/powerpoint/ms-office-online
    install -Dm755 "${srcdir}"/ms-office-online "${pkgdir}"/usr/share/ms-office/excel/ms-office-online
    install -Dm755 "${srcdir}"/ms-office-online "${pkgdir}"/usr/share/ms-office/word/ms-office-online
    install -Dm755 "${srcdir}"/ms-office-online "${pkgdir}"/usr/share/ms-office/outlook/ms-office-online
    install -Dm755 "${srcdir}"/ms-office-online "${pkgdir}"/usr/share/ms-office/onenote/ms-office-online
    install -Dm755 "${srcdir}"/ms-office-online "${pkgdir}"/usr/share/ms-office/webskype/ms-office-online
    
    # Install json settings
    install -Dm644 "${srcdir}"/settings.json "${pkgdir}"/usr/share/ms-office/msoffice/settings.json
    install -Dm644 "${srcdir}"/settings.json "${pkgdir}"/usr/share/ms-office/powerpoint/settings.json
    install -Dm644 "${srcdir}"/settings.json "${pkgdir}"/usr/share/ms-office/excel/settings.json
    install -Dm644 "${srcdir}"/settings.json "${pkgdir}"/usr/share/ms-office/word/settings.json
    install -Dm644 "${srcdir}"/settings.json "${pkgdir}"/usr/share/ms-office/outlook/settings.json
    install -Dm644 "${srcdir}"/settings.json "${pkgdir}"/usr/share/ms-office/onenote/settings.json
    install -Dm644 "${srcdir}"/settings.json "${pkgdir}"/usr/share/ms-office/webskype/settings.json
    
    # Create binaries
    mkdir -p "${pkgdir}"/usr/bin

    echo "#!/bin/sh" > "${pkgdir}"/usr/bin/msoffice
    echo "cd /usr/share/ms-office/msoffice" >> "${pkgdir}"/usr/bin/msoffice
    echo "./ms-office-online" >> "${pkgdir}"/usr/bin/msoffice
    sed -i -e "s|_URL_|https://www.office.com/login?es=Click&ru=%2F|" "${pkgdir}"/usr/share/ms-office/msoffice/settings.json

    echo "#!/bin/sh" > "${pkgdir}"/usr/bin/powerpoint
    echo "cd /usr/share/ms-office/powerpoint" >> "${pkgdir}"/usr/bin/powerpoint
    echo "./ms-office-online" >> "${pkgdir}"/usr/bin/powerpoint
    sed -i -e "s|_URL_|https://office.live.com/start/PowerPoint.aspx|" "${pkgdir}"/usr/share/ms-office/powerpoint/settings.json

    echo "#!/bin/sh" > "${pkgdir}"/usr/bin/excel
    echo "cd /usr/share/ms-office/excel" >> "${pkgdir}"/usr/bin/excel
    echo "./ms-office-online" >> "${pkgdir}"/usr/bin/excel
    sed -i -e "s|_URL_|https://office.live.com/start/Excel.aspx|" "${pkgdir}"/usr/share/ms-office/excel/settings.json

    echo "#!/bin/sh" > "${pkgdir}"/usr/bin/word
    echo "cd /usr/share/ms-office/word" >> "${pkgdir}"/usr/bin/word
    echo "./ms-office-online" >> "${pkgdir}"/usr/bin/word
    sed -i -e "s|_URL_|https://office.live.com/start/Word.aspx|" "${pkgdir}"/usr/share/ms-office/word/settings.json

    echo "#!/bin/sh" > "${pkgdir}"/usr/bin/outlook
    echo "cd /usr/share/ms-office/outlook" >> "${pkgdir}"/usr/bin/outlook
    echo "./ms-office-online" >> "${pkgdir}"/usr/bin/outlook
    sed -i -e "s|_URL_|https://outlook.live.com/owa|" "${pkgdir}"/usr/share/ms-office/outlook/settings.json

    echo "#!/bin/sh" > "${pkgdir}"/usr/bin/onenote
    echo "cd /usr/share/ms-office/onenote" >> "${pkgdir}"/usr/bin/onenote
    echo "./ms-office-online" >> "${pkgdir}"/usr/bin/onenote
    sed -i -e "s|_URL_|https://www.onenote.com/notebooks|" "${pkgdir}"/usr/share/ms-office/onenote/settings.json

    echo "#!/bin/sh" > "${pkgdir}"/usr/bin/webskype
    echo "cd /usr/share/ms-office/webskype" >> "${pkgdir}"/usr/bin/webskype
    echo "./ms-office-online" >> "${pkgdir}"/usr/bin/webskype
    sed -i -e "s|_URL_|https://web.skype.com|" "${pkgdir}"/usr/share/ms-office/webskype/settings.json

    chmod a+x "${pkgdir}"/usr/bin/*

    # Configure json settings
    sed -i -e "s|_icon_|/usr/share/icons/ms-office/MSOffice.png|" "${pkgdir}"/usr/share/ms-office/msoffice/settings.json
    sed -i -e "s|_icon_|/usr/share/icons/ms-office/PowerPoint.png|" "${pkgdir}"/usr/share/ms-office/powerpoint/settings.json
    sed -i -e "s|_icon_|/usr/share/icons/ms-office/Excel.png|" "${pkgdir}"/usr/share/ms-office/excel/settings.json
    sed -i -e "s|_icon_|/usr/share/icons/ms-office/Word.png|" "${pkgdir}"/usr/share/ms-office/word/settings.json
    sed -i -e "s|_icon_|/usr/share/icons/ms-office/Outlook.png|" "${pkgdir}"/usr/share/ms-office/outlook/settings.json
    sed -i -e "s|_icon_|/usr/share/icons/ms-office/OneNote.png|" "${pkgdir}"/usr/share/ms-office/onenote/settings.json
    sed -i -e "s|_icon_|/usr/share/icons/ms-office/WebSkype.png|" "${pkgdir}"/usr/share/ms-office/webskype/settings.json

    # Install icons
    install -Dm644 "${srcdir}"/MSOffice.png "${pkgdir}"/usr/share/icons/ms-office/MSOffice.png
    install -Dm644 "${srcdir}"/PowerPoint.png "${pkgdir}"/usr/share/icons/ms-office/PowerPoint.png
    install -Dm644 "${srcdir}"/Excel.png "${pkgdir}"/usr/share/icons/ms-office/Excel.png
    install -Dm644 "${srcdir}"/Word.png "${pkgdir}"/usr/share/icons/ms-office/Word.png
    install -Dm644 "${srcdir}"/Outlook.png "${pkgdir}"/usr/share/icons/ms-office/Outlook.png
    install -Dm644 "${srcdir}"/OneNote.png "${pkgdir}"/usr/share/icons/ms-office/OneNote.png
    install -Dm644 "${srcdir}"/WebSkype.png "${pkgdir}"/usr/share/icons/ms-office/WebSkype.png

    # Install desktop files
    install -Dm644 "${srcdir}"/MSOffice.desktop "${pkgdir}"/usr/share/applications/MSOffice.desktop
    install -Dm644 "${srcdir}"/PowerPoint.desktop "${pkgdir}"/usr/share/applications/PowerPoint.desktop
    install -Dm644 "${srcdir}"/Excel.desktop "${pkgdir}"/usr/share/applications/Excel.desktop
    install -Dm644 "${srcdir}"/Word.desktop "${pkgdir}"/usr/share/applications/Word.desktop
    install -Dm644 "${srcdir}"/Outlook.desktop "${pkgdir}"/usr/share/applications/Outlook.desktop
    install -Dm644 "${srcdir}"/OneNote.desktop "${pkgdir}"/usr/share/applications/OneNote.desktop
    install -Dm644 "${srcdir}"/WebSkype.desktop "${pkgdir}"/usr/share/applications/WebSkype.desktop
}
