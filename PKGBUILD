# Maintainer: Philip Goto <philip.goto@gmail.com>
pkgname=xcursor-chromeos
pkgver=latest
pkgrel=1
pkgdesc="The cursors from Chrome OS"
arch=('any')
url="https://www.chromium.org/chromium-os"
license=('unknown')
makedepends=('xorg-xcursorgen')
provides=('chromeos-cursors')
source=("https://chromium.googlesource.com/chromium/src/+archive/master/ui/resources.tar.gz"
        "makefile")
md5sums=('SKIP'
         'SKIP')

prepare() {
    mkdir "${pkgname}-${pkgver}"
    cd "${pkgname}-${pkgver}"

    mv "../makefile" "makefile"

    mv "../default_100_percent/common/pointers/alias.png" "alias_25.png"
    mv "../default_100_percent/common/pointers/cell.png" "cell_25.png"
	mv "../default_100_percent/common/pointers/context_menu.png" "context_menu_25.png"
	mv "../default_100_percent/common/pointers/copy.png" "copy_25.png"
	mv "../default_100_percent/common/pointers/crosshair.png" "crosshair_25.png"
	mv "../default_100_percent/common/pointers/fleur.png" "hand1_25.png"
	mv "../default_100_percent/common/pointers/hand2.png" "hand2_25.png"
	mv "../default_100_percent/common/pointers/hand3.png" "grabbing_25.png"
	mv "../default_100_percent/common/pointers/help.png" "help_25.png"
	mv "../default_100_percent/common/pointers/left_ptr.png" "left_ptr_25.png"
	mv "../default_100_percent/common/pointers/move.png" "move_25.png"
	mv "../default_100_percent/common/pointers/nodrop.png" "nodrop_25.png"
	mv "../default_100_percent/common/pointers/sb_h_double_arrow.png" "sb_h_double_arrow_25.png"
	mv "../default_100_percent/common/pointers/sb_v_double_arrow.png" "sb_v_double_arrow_25.png"
	mv "../default_100_percent/common/pointers/top_left_corner.png" "top_left_corner_25.png"
	mv "../default_100_percent/common/pointers/top_right_corner.png" "top_right_corner_25.png"
	mv "../default_100_percent/common/pointers/xterm.png" "xterm_25.png"
	mv "../default_100_percent/common/pointers/xterm_horiz.png" "xterm_horiz_25.png"
	mv "../default_100_percent/common/pointers/zoom_in.png" "zoom_in_25.png"
	mv "../default_100_percent/common/pointers/zoom_out.png" "zoom_out_25.png"

	mv "../default_200_percent/common/pointers/alias.png" "alias_50.png"
    mv "../default_200_percent/common/pointers/cell.png" "cell_50.png"
	mv "../default_200_percent/common/pointers/context_menu.png" "context_menu_50.png"
	mv "../default_200_percent/common/pointers/copy.png" "copy_50.png"
	mv "../default_200_percent/common/pointers/crosshair.png" "crosshair_50.png"
	mv "../default_200_percent/common/pointers/fleur.png" "hand1_50.png"
	mv "../default_200_percent/common/pointers/hand2.png" "hand2_50.png"
	mv "../default_200_percent/common/pointers/hand3.png" "grabbing_50.png"
	mv "../default_200_percent/common/pointers/help.png" "help_50.png"
	mv "../default_200_percent/common/pointers/left_ptr.png" "left_ptr_50.png"
	mv "../default_200_percent/common/pointers/move.png" "move_50.png"
	mv "../default_200_percent/common/pointers/nodrop.png" "nodrop_50.png"
	mv "../default_200_percent/common/pointers/sb_h_double_arrow.png" "sb_h_double_arrow_50.png"
	mv "../default_200_percent/common/pointers/sb_v_double_arrow.png" "sb_v_double_arrow_50.png"
	mv "../default_200_percent/common/pointers/top_left_corner.png" "top_left_corner_50.png"
	mv "../default_200_percent/common/pointers/top_right_corner.png" "top_right_corner_50.png"
	mv "../default_200_percent/common/pointers/xterm.png" "xterm_50.png"
	mv "../default_200_percent/common/pointers/xterm_horiz.png" "xterm_horiz_50.png"
	mv "../default_200_percent/common/pointers/zoom_in.png" "zoom_in_50.png"
	mv "../default_200_percent/common/pointers/zoom_out.png" "zoom_out_50.png"
}

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"

    install -dm 755 "${pkgdir}/usr/share/icons/${pkgname}/cursors/"

	install -m 644 "zoom_out" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "alias" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "cell" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "context_menu" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "copy" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "crosshair" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "grabbing" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "hand1" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "hand2" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "help" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "left_ptr" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "move" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "nodrop" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "sb_h_double_arrow" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "sb_v_double_arrow" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "top_left_corner" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "top_right_corner" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "xterm" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "xterm_horiz" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"
    install -m 644 "zoom_in" "${pkgdir}/usr/share/icons/${pkgname}/cursors/"

    ln -s "alias" "${pkgdir}/usr/share/icons/${pkgname}/cursors/dnd-link"
    ln -s "bottom_left_corner" "${pkgdir}/usr/share/icons/${pkgname}/cursors/sw-resize"
    ln -s "bottom_right_corner" "${pkgdir}/usr/share/icons/${pkgname}/cursors/se-resize"
    ln -s "crosshair" "${pkgdir}/usr/share/icons/${pkgname}/cursors/cross"
    ln -s "grabbing" "${pkgdir}/usr/share/icons/${pkgname}/cursors/fleur"
    ln -s "grabbing" "${pkgdir}/usr/share/icons/${pkgname}/cursors/pointer-move"
    ln -s "grabbing" "${pkgdir}/usr/share/icons/${pkgname}/cursors/dnd-move"
    ln -s "hand" "${pkgdir}/usr/share/icons/${pkgname}/cursors/pointer"
    ln -s "hand1" "${pkgdir}/usr/share/icons/${pkgname}/cursors/grab"
    ln -s "hand2" "${pkgdir}/usr/share/icons/${pkgname}/cursors/hand"
    ln -s "help" "${pkgdir}/usr/share/icons/${pkgname}/cursors/left_ptr_help"
    ln -s "left_ptr" "${pkgdir}/usr/share/icons/${pkgname}/cursors/all-scroll"
    ln -s "left_ptr" "${pkgdir}/usr/share/icons/${pkgname}/cursors/arrow"
    ln -s "left_ptr" "${pkgdir}/usr/share/icons/${pkgname}/cursors/default"
    ln -s "left_ptr" "${pkgdir}/usr/share/icons/${pkgname}/cursors/wait"
    ln -s "left_ptr" "${pkgdir}/usr/share/icons/${pkgname}/cursors/watch"
    ln -s "nodrop" "${pkgdir}/usr/share/icons/${pkgname}/cursors/no-drop"
    ln -s "nodrop" "${pkgdir}/usr/share/icons/${pkgname}/cursors/dnd-no-drop"
    ln -s "sb_h_double_arrow" "${pkgdir}/usr/share/icons/${pkgname}/cursors/e-resize"
    ln -s "sb_h_double_arrow" "${pkgdir}/usr/share/icons/${pkgname}/cursors/ew-resize"
    ln -s "sb_h_double_arrow" "${pkgdir}/usr/share/icons/${pkgname}/cursors/h_double_arrow"
    ln -s "sb_h_double_arrow" "${pkgdir}/usr/share/icons/${pkgname}/cursors/left_side"
    ln -s "sb_h_double_arrow" "${pkgdir}/usr/share/icons/${pkgname}/cursors/right_side"
    ln -s "sb_h_double_arrow" "${pkgdir}/usr/share/icons/${pkgname}/cursors/w-resize"
    ln -s "sb_v_double_arrow" "${pkgdir}/usr/share/icons/${pkgname}/cursors/bottom_side"
    ln -s "sb_v_double_arrow" "${pkgdir}/usr/share/icons/${pkgname}/cursors/n-resize"
    ln -s "sb_v_double_arrow" "${pkgdir}/usr/share/icons/${pkgname}/cursors/ns-resize"
    ln -s "sb_v_double_arrow" "${pkgdir}/usr/share/icons/${pkgname}/cursors/s-resize"
    ln -s "sb_v_double_arrow" "${pkgdir}/usr/share/icons/${pkgname}/cursors/row-resize"
    ln -s "sb_v_double_arrow" "${pkgdir}/usr/share/icons/${pkgname}/cursors/top_side"
    ln -s "sb_v_double_arrow" "${pkgdir}/usr/share/icons/${pkgname}/cursors/v_double_arrow"
    ln -s "top_right_corner" "${pkgdir}/usr/share/icons/${pkgname}/cursors/bd_double_arrow"
    ln -s "top_left_corner" "${pkgdir}/usr/share/icons/${pkgname}/cursors/bottom_right_corner"
    ln -s "top_left_corner" "${pkgdir}/usr/share/icons/${pkgname}/cursors/nw-resize"
    ln -s "top_right_corner" "${pkgdir}/usr/share/icons/${pkgname}/cursors/bottom_left_corner"
    ln -s "top_right_corner" "${pkgdir}/usr/share/icons/${pkgname}/cursors/fd_double_arrow"
    ln -s "top_right_corner" "${pkgdir}/usr/share/icons/${pkgname}/cursors/ne-resize"
    ln -s "xterm" "${pkgdir}/usr/share/icons/${pkgname}/cursors/text"
}
