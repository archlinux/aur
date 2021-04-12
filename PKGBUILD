# Maintainer: DuckSoft <realducksoft@gmail.com>
pkgbase=ttf-menksoft
pkgver=1.0
pkgname=(ttf-menksoft-{mong,manchu,todo,huihu,sibe}-2.01 ttf-menksoft-{1.02,2.002})
pkgrel=3
arch=(any)
url=http://www.menksoft.com/
license=(custom)
depends=(fontconfig xorg-font-utils)
source=(
    http://www.menksoft.com/Portals/_MenkCms/Products/Fonts/MenksoftTrueType_{Mong,Manchu,Todo,Huihu,Sibe}2.01.zip
    http://www.menksoft.com/Portals/_MenkCms/Products/Fonts/MenksoftOpenType1.02.zip
    Menk_New_Fonts2.002.rar::http://www.menksoft.com/Portals/_MenkCms/Products/Fonts/Menk_New_Fonts--%E7%89%88%E6%9C%AC%E5%8F%B72.002.rar
)

# (2015.09) MenksoftTrueType_Mong2.01.zip
package_ttf-menksoft-mong-2.01() {
    pkgdesc="蒙科立编码传统蒙古文字库 (v2.01, 2015.09)"
    provides=(ttf-menksoft-mong-2.01)
    conflicts=(ttf-menksoft-mong-2.01)
    install -Dm644 -vt $pkgdir/usr/share/fonts/TTF/ $srcdir/MenksoftTrueType_Mong2.01/*
}

# (2015.09) MenksoftTrueType_Manchu2.01.zip
package_ttf-menksoft-manchu-2.01() {
    pkgdesc="蒙科立编码满文字库 (v2.01, 2015.09)"
    provides=(ttf-menksoft-manchu-2.01)
    conflicts=(ttf-menksoft-manchu-2.01)
    install -Dm644 -vt $pkgdir/usr/share/fonts/TTF/ $srcdir/MenksoftTrueType_Manchu2.01/*
}

# (2015.09) MenksoftTrueType_Todo2.01.zip
package_ttf-menksoft-todo-2.01() {
    pkgdesc="蒙科立编码托忒文字库 (v2.01, 2015.09)"
    provides=(ttf-menksoft-todo-2.01)
    conflicts=(ttf-menksoft-todo-2.01)
    install -Dm644 -vt $pkgdir/usr/share/fonts/TTF/ $srcdir/MenksoftTrueType_Todo2.01/*
}

# (2015.09) MenksoftTrueType_Huihu2.01.zip
package_ttf-menksoft-huihu-2.01() {
    pkgdesc="蒙科立编码回鹘式蒙古文字库 (v2.01, 2015.09)"
    provides=(ttf-menksoft-huihu-2.01)
    conflicts=(ttf-menksoft-huihu-2.01)
    install -Dm644 -vt $pkgdir/usr/share/fonts/TTF/ $srcdir/MenksoftTrueType_Huihu2.01/*
}

# (2015.09) MenksoftTrueType_Sibe2.01.zip
package_ttf-menksoft-sibe-2.01() {
    pkgdesc="蒙科立编码锡伯文字库 (v2.01, 2015.09)"
    provides=(ttf-menksoft-sibe-2.01)
    conflicts=(ttf-menksoft-sibe-2.01)
    install -Dm644 -vt $pkgdir/usr/share/fonts/TTF/ $srcdir/MenksoftTrueType_Sibe2.01/*
}

# (2017.08) MenksoftOpenType1.02.zip
package_ttf-menksoft-1.02() {
    pkgdesc="蒙科立标准编码字库 (v1.02, 2017.08)"
    provides=(ttf-menksoft-1.02)
    conflicts=(ttf-menksoft-1.02)
	install -Dm644 -vt $pkgdir/usr/share/fonts/TTF/ $srcdir/MenksoftOpenType1.02/*
}

# (2021.03) Menk_New_Fonts2.002.rar
package_ttf-menksoft-2.002() {
    pkgdesc="蒙科立蒙古文字体 (v2.0, 2021.03)"
    provides=(ttf-menksoft-2.002)
    conflicts=(ttf-menksoft-2.002)
    local FILES=(
        MAM8200.ttf MBJ8200.ttf MER8200.ttf MHL8200.ttf MHW8200.ttf MLU8200.ttf MMD8200.ttf
        MPB8200.ttf MQG8200.ttf MQM8200.ttf MSN8200.ttf MTH8200.ttf MVR8200.ttf MWJ8200.ttf
        MBD8200.ttf MBN8200.ttf MGQ8200.ttf MHR8200.ttf MLD8200.ttf MMB8200.ttf MNR8200.ttf
        MQD8200.ttf MQI8200.ttf MSH8200.ttf MSO8200.ttf MTR8200.ttf MVY8200.ttf MYN8200.ttf
    )
    install -Dm644 -vt $pkgdir/usr/share/fonts/TTF/ ${FILES[@]/#/"$srcdir"/}
}


b2sums=('dd204d9cfc244ceb11ccb1173b92e0155ddb13b9b3f0f3b9729053b9d6428b2aaf16f332c8d69929769dcbde87b59af4368dd291b56578ae8f3cdba8d88a9a20'
        '4a3c62f20de49095b80af1d5b4fb67afc5dde18fe8698f20b2b35fc8d25481c7ecbd84f1ea010027f869c9a13a257a0e001f818634ac201c2f47b8949b84be9e'
        'b7ae1c6b43a1312527c2b560bb9765309106fa8c682a21d92c1a5e6f5c247c21752840aadf0687eea21daf4bc190b7f036aa47d2593f1e48279c83707b08fef3'
        'a0e441dc34a93925f64568e152bd920723c791bf964c817e31bef01a0f7be13f775c3b45333358c6a1d97506a4d0aa1483cc215703527019b7e97f1721701cc7'
        'e43e47b3a1b5b8b2e799e3e4b7c0227f112c009c3ffeff3636df5ece2e9bbf14be64b0dbcc84489b6da7376e7d81ae056689c00da7f46664a2654cafee49e361'
        'e79de87572b850bf25b25b510847edc3b0bf6502761dd42a3f268aeeabb2030f17dd7b43acd1af745a1f766c192e23dbfa1eda686e914e86202b718e87bf2f11'
        '9fb698bafbc16eb99303ffe65d833a0a8b5105cfbda249579a797d987785e114471885943bfe6e2bb74aaea41e0a2161ae388643086271bc426f73bd559e2474')
