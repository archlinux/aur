# Maintainer: taotieren <admin@taotieren.com>

pkgbase=lckfb-meta
pkgname=(lckfb-meta lckfb-taishanpi-meta)
pkgver=0.0.6
pkgrel=0
epoch=
pkgdesc="立创开发板元包 / LCKFB Development Board meta package"
arch=(any)
url="https://lckfb.com/"
license=('Apache-2.0')
# groups=()
# depends=()
# makedepends=()
# checkdepends=()
# optdepends=()
# provides=()
# conflicts=()
# replaces=()
# backup=()
options=()
# install=
# changelog=
source=(lckfb-taishanpi-meta.install)
sha256sums=('5173de61766b994e3f4dabb707aff92e54c44a6cd8c961b602519f14822c6cce')
# noextract=()
#validpgpkeys=()


package_lckfb-meta() {
    pkgdesc=${pkgdesc}
    depends=(lckfb-taishanpi-meta)
}

package_lckfb-taishanpi-meta() {
    pkgdesc="立创开发板泰山派元包 / LCKFB Development Board TaishanPi meta package"
    provides=("lckfb-taishanpi")
    conflicts=("lckfb-taishanpi")
    install=$pkgname.install
    depends=(
        # pcb
        lceda-pro

        # repo
        repo
        git
        openssh
        openssl

        # build source
        bison
        chrpath
        coreutils
        cmake
        diffstat
        dtc
        expect
        fakeroot
        flex
        gawk
        gcc
        gcc-libs
        gdb
        lz4
        make
        qemu-user-static
        qemu-user-static-binfmt
        ncurses
        patchelf
        python
        python-pip
        python-pyelftools
        tar
        texinfo
        unzip

        # build u-boot & kernel for arm64
        aarch64-linux-gnu-gcc

        # rockchip official tools
        rkbin
        rkdeveloptool
        rkflashtool

        # Third-party rockchip tools
        xrock

        # Android debug
        android-file-transfer
        android-tools
        android-udev
        balena-etcher
        scrcpy
        windterm
    )
    optdepends=(
        # Network Sharing
        samba

        # buildroot
        buildroot-meta

        # ch34x driver
        ch34x-dkms
        ch343ser-dkms

        # Android debug
        escrcpy
        )
}

