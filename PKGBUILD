# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Tucker Boniface <tucker@boniface.tech>
# Contributor: Tom Kwok <contact@tomkwok.com>
# Contributor: Jose Valecillos <valecillosjg at gmail dot com>
# Contributor: Guido <qqqqqqqqq9 at web dot de>
# Contributor: Limao Luo <luolimao+AUR at gmail com>
# Contributor: Alexander Fehr <pizzapunk at gmail dot com>
# Olivier Esser: Add needed old versions of lib32-glib2 and lib32-harfbuzz <olivier dot esser at gmail dot com>

pkgname=acroread
pkgver=9.5.5
pkgrel=15
pkgdesc="Adobe Acrobat Reader is a PDF file viewer"
arch=('i686' 'x86_64')
url="http://www.adobe.com/products/reader/"
license=(custom)
optdepends=('acroread-fonts: CJK and extended font packs'
            'libcanberra: XDG sound support'
            'gtk-engine-murrine: fix ugly buttons and scrollbars'
            )
depends=('desktop-file-utils' lib32-{at-spi2-atk,libcanberra,cairo,libxinerama,libxi,libxrandr,libxcursor,libxcomposite,fribidi,libthai,mesa,glu})
optdepends=('acroread-fonts: CJK and extended font packs'
            'lib32-gtk-engine-murrine: fix ugly buttons and scrollbars')
options=(!strip)
install=$pkgname.install
source=($pkgname.desktop
        http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/$pkgver/enu/AdbeRdr$pkgver-1_i486linux_enu.bin
	http://mirrors.aggregate.org/archlinux/multilib/os/x86_64/lib32-glib2-2.52.2+9+g3245eba16-1-x86_64.pkg.tar.xz
	http://mirrors.aggregate.org/archlinux/multilib/os/x86_64/lib32-harfbuzz-1.4.6-1-x86_64.pkg.tar.xz
	http://mirrors.aggregate.org/archlinux/multilib/os/x86_64/lib32-pango-1.40.6+9+g92cc73c8-1-x86_64.pkg.tar.xz
	http://mirrors.aggregate.org/archlinux/multilib/os/x86_64/lib32-librsvg-2.40.18-1-x86_64.pkg.tar.xz
	http://mirrors.aggregate.org/archlinux/multilib/os/x86_64/lib32-gdk-pixbuf2-2.36.6-1-x86_64.pkg.tar.xz
	http://mirrors.aggregate.org/archlinux/multilib/os/x86_64/lib32-libxml2-2.9.4+16+g07418011-1-x86_64.pkg.tar.xz
	http://mirrors.aggregate.org/archlinux/multilib/os/x86_64/lib32-gtk2-2.24.31-1-x86_64.pkg.tar.xz
	http://mirrors.aggregate.org/archlinux/multilib/os/x86_64/lib32-libxt-1.1.5-1-x86_64.pkg.tar.xz
	http://mirrors.aggregate.org/archlinux/multilib/os/x86_64/lib32-libidn-1.33-1-x86_64.pkg.tar.xz
	http://mirrors.aggregate.org/archlinux/multilib/os/x86_64/lib32-icu-59.1-1-x86_64.pkg.tar.xz
	http://mirrors.aggregate.org/archlinux/multilib/os/x86_64/lib32-atk-2.24.0+4+gbf71ccc-1-x86_64.pkg.tar.xz
	http://mirrors.aggregate.org/archlinux/multilib/os/x86_64/lib32-cairo-1.14.10-1-x86_64.pkg.tar.xz)
	
noextract=("${source[@]%%::*}")
sha512sums=('178ca8a3abf630195eaebd6a76a7e5ac19165708acd52b99acab2de3d0bdb57fdf81d666edae41a947fa5a3fc14442c86fa855860d5d3d0d3e1db0386c583b96'
            'f9c18ca0dc0687de353afeb90925439a557a14604e6361ff2b229ec29257ff051ea9eac6a90671b38a745473b5c87135377d035520f441ceaabf2510d690675b'
            '66b2825e289389a959db304e89e08ba8a971d5bc9b9382d86d11d5747abf6868151e6cb5c0c8afa63814deba40cc63d11e8445922267c388e913cb5f1bc4e6b7'
	    '3edd3fd9b1f7a98339a03ba8aa63abd8da6bccca722949b0297a0aac68134c8f572a16601fce783de168bb9ca3e0da1ae6a138cc564b79a89b02b615e5206a69'
	    'a915d5ee30e1a33e95f5aa0754d27aaf0bb381ae6fbc0df0804857487a612f45531c8b8903e398f1410e4858bf0bbf5669cc1301952fed641e380a79752c800e'
	    '7266cd708eeebd8aa17fae41e4a175e1f91b0828c0dda7824048ffb34ae5a84c585ae47b6bc7fa33ae4831ffec6b6e3c4d42671afe995cee8c86798528e9bdd4'
	    '5784eb8d85760a44364f3643262184230d9697dfc9e4a3492022eb5ea64614c34f307d0527e276765f25df17e006594b774c3ceaff86475093a76296270315a2'
	    'a9b2207700d6229a275e9c8ce844fc0e5cf3ea027792b7c2f9d044ec0446f499aa4556ecf00de13215dac9806657018ce4e1d46bbf005b254edb27887db24a01'
	    'd3e482257fd02f181c1c736bdfff6e68194ed496d88b0caef161c9c40d2449e34af80be59878de34ff6f10baa404fa15865bbcf144e3e00edb68ff8c740c4efe'
	    'e70a2c4bb4a68e017e5072f6b9542e3036190bb5ab6ac9348f9f9ed559680de464251a0546e89568b74da3011f6a852231ba5d8c001cea574cadc431f35e4bf5'
	    '09e974a34f726f1fbc8d198794cdb1104e84aaad4745f9705d26982efdec081a24673667766eab31f9ba1b70515b4e0127e2766cb14899bdc87e672191c764d7'
	    '77cf33cabce5eb2ac8d11d2af30d5504dea4e8545c9ff3d0482e9fcd8a8211d11913e30b7b0f26d46e43e3eb2122877e1fce64841b48e5e6f83705a3cfb66ac6'
	    'a5b7b739ce60c88d853540958523ffabe7850b30a7b5e32371daf64f20c123eefba5a33750f709e00eccbfdf41f889c4b88ceea1afba33d0e485810ef2983b86'
	    'd10ef55002b07c393321d16e977e8f3a3bdb01cb6a408c61733e43c8a970ef3f579c85917329f3eeb1e3d1a365006fcb6c663339517c9f6970867284ef0d16f2')
prepare() {
    # Extracting content from bin file
    tail -c+6889 AdbeRdr9.5.5-1_i486linux_enu.bin | xz -qqd | tar x
    mkdir oldlib
    tar -C oldlib -axf lib32-glib2-2.52.2+9+g3245eba16-1-x86_64.pkg.tar.xz
    tar -C oldlib -axf lib32-harfbuzz-1.4.6-1-x86_64.pkg.tar.xz
    tar -C oldlib -axf lib32-pango-1.40.6+9+g92cc73c8-1-x86_64.pkg.tar.xz
    tar -C oldlib -axf lib32-librsvg-2.40.18-1-x86_64.pkg.tar.xz
    tar -C oldlib -axf lib32-gdk-pixbuf2-2.36.6-1-x86_64.pkg.tar.xz
    tar -C oldlib -axf lib32-libxml2-2.9.4+16+g07418011-1-x86_64.pkg.tar.xz
    tar -C oldlib -axf lib32-gtk2-2.24.31-1-x86_64.pkg.tar.xz
    tar -C oldlib -axf lib32-libxt-1.1.5-1-x86_64.pkg.tar.xz
    tar -C oldlib -axf lib32-libidn-1.33-1-x86_64.pkg.tar.xz
    tar -C oldlib -axf lib32-icu-59.1-1-x86_64.pkg.tar.xz
    tar -C oldlib -axf lib32-atk-2.24.0+4+gbf71ccc-1-x86_64.pkg.tar.xz
    tar -C oldlib -axf lib32-cairo-1.14.10-1-x86_64.pkg.tar.xz

    cd AdobeReader/
    bsdtar -xf COMMON.TAR
    bsdtar -xf ILINXR.TAR

    sed -i "s/_filedir/&_acroread/" Adobe/Reader9/Resource/Shell/acroread_tab
    # Bug on log created by Adobe Reader browser plugin https://bugs.launchpad.net/ubuntu/+source/acroread/+bug/986841
    sed -i 's#C:\\nppdf32Log\\debuglog\.txt#/dev/null\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00#g' \
Adobe/Reader9/Browser/intellinux/nppdf.so
}

package() {
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/

    msg2 "Copying old libraries"
    install -d "$pkgdir/opt/Adobe/Reader9/Reader/intellinux/lib"
    cp -a oldlib/usr/lib32/* "$pkgdir/opt/Adobe/Reader9/Reader/intellinux/lib"

    cd AdobeReader/Adobe/Reader9/

    msg2 "Installing Main Files..."
    install -d "$pkgdir"/opt/Adobe/Reader9
    cp -a * "$pkgdir"/opt/Adobe/Reader9/

    msg2 "Installing Bin Files..."
    install -d "$pkgdir"/usr/bin/
    ln -s /opt/Adobe/Reader9/bin/acroread "$pkgdir"/usr/bin/
    install -Dm644 Resource/Shell/acroread.1.gz "$pkgdir"/usr/share/man/man1/acroread.1.gz
    install -Dm644 Resource/Shell/acroread_tab "$pkgdir"/etc/bash_completion.d/acroread

    msg2 "Installing Icon Resources..."
    install -Dm644 Resource/Icons/64x64/AdobeReader9.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

    msg2 "Installing License..."
    install -Dm644 Reader/Legal/en_US/License.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
