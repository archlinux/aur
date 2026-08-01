# Maintainer: Cetronix <trm.seven@gmail.com>
pkgname=ascon-kompas3d-v25-home
pkgver=25.0.1.2738
pkgrel=1
pkgdesc="CAD software for mechanical engineering (Home Edition)"
url="https://kompas.ru/"
arch=("x86_64")
license=("custom")
options=(!strip !debug)

# Скрипт установки
install='ascon-kompas3d-v25-home.install'

depends=(
	"freetype2" "xdg-utils" "ttf-opensans" "libxxf86vm" "libdrm" "glu"
	"libglvnd" "xcb-util-wm" "libxkbfile" "libxss" "libxv" "qt6-base"
	"xcb-util-keysyms" "libfontenc" "gdk-pixbuf2" "libsm" "libxpm" "libxt"
	"zlib" "cairo" "at-spi2-core" "xcb-util-image" "libice" "libstdc++"
	"libcups" "xcb-util-renderutil" "libgcc" "glibc" "glib2" "libwebp"
	"pango" "libxmu" "hicolor-icon-theme" "libxcomposite" "libc++abi"
	"libxaw" "libxrandr" "libxinerama" "libxres" "libxcursor" "libxdamage"
	"libc++" "libxcb" "libxext" "libx11" "xcb-util" "libxtst" "fontconfig"
	"util-linux-libs" "libatomic" "xcb-util-cursor" "libtiff" "libxdmcp"
	"libxau" "libxi" "libxrender" "libxfixes" "gtk2"
)

makedepends=("libarchive")

_repo="https://repo.ascon.ru/stable/alt/p11/x86_64/RPMS.main"

source=(
	# Общие компоненты v25
	"${_repo}/ascon-kompas-checker-v25-${pkgver}-0.x86_64.rpm"
	"${_repo}/ascon-kompas-coupling-v25-${pkgver}-0.x86_64.rpm"
	"${_repo}/ascon-kompas-diecore-v25-${pkgver}-0.x86_64.rpm"
	"${_repo}/ascon-kompas-dimchain-v25-${pkgver}-0.x86_64.rpm"
	"${_repo}/ascon-kompas-featurekompas-v25-${pkgver}-0.x86_64.rpm"
	"${_repo}/ascon-kompas-graphic-v25-${pkgver}-0.x86_64.rpm"
	"${_repo}/ascon-kompas-help-v25-${pkgver}-0.x86_64.rpm"
	"${_repo}/ascon-kompas-libsamples-v25-${pkgver}-0.x86_64.rpm"
	"${_repo}/ascon-kompas-mouldcore-v25-${pkgver}-0.x86_64.rpm"
	"${_repo}/ascon-kompas-nesting-v25-${pkgver}-0.x86_64.rpm"
	"${_repo}/ascon-kompas-sdk-v25-${pkgver}-0.x86_64.rpm"
	"${_repo}/ascon-kompas-servicetools-v25-${pkgver}-0.x86_64.rpm"
	"${_repo}/ascon-kompas-trays-v25-${pkgver}-0.x86_64.rpm"
	"${_repo}/ascon-kompas-tutorials-v25-${pkgver}-0.x86_64.rpm"
	"${_repo}/ascon-kompas3d-v25-${pkgver}-0.x86_64.rpm"
	"${_repo}/ascon-kompas-plugins-v25-${pkgver}-0.x86_64.rpm"
	"${_repo}/ascon-kompas-sdf3dapp-v25-${pkgver}-0.x86_64.rpm"
	"${_repo}/ascon-kompas-tutorials-3dprint-v25-${pkgver}-0.x86_64.rpm"
	
	# Компоненты со специфичными версиями
	"${_repo}/ascon-polynom-library-24.0-24.0.0.26061516-0.x86_64.rpm"
	"${_repo}/grdcontrol-4.5.3-0.x86_64.rpm"
	"${_repo}/ascon-helpserver-0.8.1.9-0.x86_64.rpm"
	"${_repo}/ascon-kompas-common-1.0.0.6-0.x86_64.rpm"
	"${_repo}/ascon-kompas-fonts-1.0.0.7-0.x86_64.rpm"
	"${_repo}/ascon-kompas-kactivation-v25-4.3.9.134-alt1.x86_64.rpm"
	
	# Home-специфичные компоненты
	"${_repo}/ascon-kompas-home-v25-${pkgver}-0.x86_64.rpm"

	# Скрипт установки
	"ascon-kompas3d-v25-home.install"
)

sha256sums=('f4cecf64bf9c19dde491d00f44d95086d77103a8973ba1fc718b5b91b5b0b3ae'
            '7b02c40dc3ae36b66386f154525b52c878b1a437d24a14b1cf0ba6ed30ff0d9e'
            'f3fcb680854eab5c0d3ec2d6f821e803dfe9ef3b6fe4e825a29f0065ec15f619'
            'ed20cfd73ded5cbeb58bf462b42dba62f9ef26909b8965c6da12c0872ffa897e'
            '8751cb6e14302f9378f3c5e35ef11db30335188652a078fa2854858028d16be7'
            '2534a5c09e9871c668c0f5a1e2d2c151e39668307aceb6919636e2f522de329f'
            'ac146e3ce78d12cdd77d83efcff355266bcc11024b52cbd8b0bc98a0cc751ec9'
            '1a06e59b189434ab6936a8b28b1a305710913aeedd18ed6721d9725879000b29'
            '202b9354c6d0f7b855fc3cc0956f560995e154e149cce5478c0be0cfc083b813'
            '834241e688926c765becccae5e4bbd24dc757c42d7a620505c41492dd58eef4b'
            'b72d4bf12433a3097642d702ce06e069d52ab2e9caf651da726ee1a7c105e113'
            'eb87e5af375f05cc5b318f5039f22badba5b1f4c9698c11d91c62cb0326fa0d6'
            'ee8fa65b8c77d1ebd746dcf9e073aa9d8c10493baa703fe0f1c646c9a3704c48'
            'acd13b4a5432af1fd5051450e142e0906410a268fafc6150c085392433d60e75'
            '050d9599194d34cd25935b5251b57cddee3890698b915ae82855d721b19a85d8'
            '6ca681d96242be201767acae8212ee251bc680f87cd222c3ced338d4da6ebc94'
            'e90d1c4860a10cf2b678cfb4f0262629f9a8e38cc386eb67ef605dfa3fa137df'
            'f68de1ace58c371a5d42443e9a313fe1dfc9fd2f45cc98442b509192419f2b6f'
            '1803649622b741712b72335f87ec9dfafb6492a8b63ab3161b85f4acc3471598'
            '983e431213cdeea9ac38a633df8acc62f582f01ac5e0d3a1dfa8a8b2b65c77cb'
            '01fcf31a7348e853158649703f3d4a992e64049faadb3ee3ef477bd5c1496176'
            '33e16f2b61c0c9b71e15956e9303dd094be8a6f6bc960659ed8685bbbedfe351'
            'f8584143474718e3de97ea5a7d88cefb5e2c0b7e0b0c98a5804f9b03dda474a7'
            '11d852647ee181ae8976d0bfa7d529cd7f78e5a8892515e2c2bb9513a9106a9d'
            '6b5562d0193027f0795e588e913ec23ccb7788bb1ae944db121a22442ac7e612'
            '9a16ec01ce6105c43f44f9faf1e5dfe8c7a5d208f473ca4c6dd51b5228ae9e0f')

package() {
    # Fix для bsdtar и кириллических имен файлов
    export LANG=C.UTF-8
    export LC_ALL=C.UTF-8

    msg2 "Копирование файлов из извлеченных RPM-пакетов..."

    [[ -d "$srcdir/etc" ]] && cp -a "$srcdir/etc" "$pkgdir/"
    [[ -d "$srcdir/opt" ]] && cp -a "$srcdir/opt" "$pkgdir/"
    [[ -d "$srcdir/usr" ]] && cp -a "$srcdir/usr" "$pkgdir/"

    msg2 "Настройка ярлыков и окружения..."

    if [[ -f "$pkgdir/usr/share/desktop-directories/kompas-home-25.directory" ]]; then
        echo "Name[en]=KOMPAS-3D v25 Home" >> "$pkgdir/usr/share/desktop-directories/kompas-home-25.directory"
    fi

    mkdir -p "$pkgdir/opt/ascon/kompas3d-v25/Bin"
    ln -sf /usr/lib/libunwind.so "$pkgdir/opt/ascon/kompas3d-v25/Bin/libunwind.so.1"

    chmod +x "$pkgdir/usr/bin/Ascon.HelpServer"

    ln -sf "/opt/ascon/kompas3d-v25/Bin/kHome" "$pkgdir/usr/bin/kompas3d-v25"
    ln -sf "/opt/ascon/kompas3d-v25/License/kactivation" "$pkgdir/usr/bin/kompas-kactivation-v25"

    mkdir -p "$pkgdir/etc/profile.d"
    echo "export KOMPAS_SDK=/opt/ascon/kompas3d-v25/SDK/" > "$pkgdir/etc/profile.d/ascon-kompas-sdk.sh"

    if [[ -d "$pkgdir/opt/ascon/polynom-library" ]]; then
        ln -snf "/opt/ascon/polynom-library" "$pkgdir/opt/ascon/kompas3d-v25/Libs/PolynomLib"
    fi

    msg2 "Настройка защиты Guardant (grdcontrol)..."
    mkdir -p "$pkgdir/etc/udev/rules.d"
    mkdir -p "$pkgdir/usr/lib/systemd/system"

    ln -sf "/opt/guardant/grdcontrol/license_wizard" "$pkgdir/usr/bin/license_wizard"

    if [[ -f "$pkgdir/opt/guardant/grdcontrol/95-grdnt.rules" ]]; then
        cp "$pkgdir/opt/guardant/grdcontrol/95-grdnt.rules" "$pkgdir/etc/udev/rules.d/"
    fi
    if [[ -f "$pkgdir/opt/guardant/grdcontrol/grdcontrol.service" ]]; then
        cp "$pkgdir/opt/guardant/grdcontrol/grdcontrol.service" "$pkgdir/usr/lib/systemd/system/"
    fi

    find "$pkgdir/opt/ascon/kompas3d-v25/Bin" -type f -exec chmod +x {} \; 2>/dev/null || true
}
