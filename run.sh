#!/bin/bash


names=("vivado-library"
	     "vivado-boards"
	     "digilent-xdc"
	     "digilent-vivado-scripts"
	     "basys3"
	     "basys-3-abacus"
	     "basys-3-gpio"
	     "basys-3-keyboard"
	     "basys-3-xadc")

descs=("free-to-use IP cores and interface definitions compatible with Xilinx Vivado IP Catalog"
	     "Vivado Board Files for Digilent Boards"
	     "A collection of Master XDC board constraints files for Digilent FPGA and Zynq boards"
	     "Tcl/python3 scripts to convert between git repos and Vivado/Xilinx SDK projects"
	     "Basys 3 demos"
	     "Basys 3 Abacus Demo"
	     "Basys 3 General Input/Output Demo"
	     "Basys 3 Keyboard Demo"
	     "Basys 3 XADC Demo")

urls=("https://reference.digilentinc.com/vivado:library"
      "https://reference.digilentinc.com/reference/software/vivado/board-files"
      "https://reference.digilentinc.com/learn/software/tutorials/vivado-xdc-file"
      "https://github.com/Digilent/digilent-vivado-scripts"
      "https://reference.digilentinc.com/learn/software/tutorials/vivado-projects-from-digilent-github/start"
      "https://reference.digilentinc.com/learn/programmable-logic/tutorials/basys-3-abacus/start"
      "https://reference.digilentinc.com/learn/programmable-logic/tutorials/basys-3-general-io/start"
      "https://reference.digilentinc.com/learn/programmable-logic/tutorials/basys-3-keyboard-demo/start"
      "https://reference.digilentinc.com/learn/programmable-logic/tutorials/basys-3-xadc/start")

lics=("custom:MIT"
      "unknown"
      "unknown"
      "unknown"
      "unknown"
      "unknown"
      "unknown"
      "unknown"
      "unknown")

tags=(true
	    false
	    false
	    false
      true
      true
      true
      true
      true)

# { for i in {0..8}; do
	# printf "%-10s %-10s %-23s %-87s %-101s\n" "${tags[$i]}" "${lics[$i]}" "${names[$i]}" "${descs[$i]}" "${urls[$i]}"
# done } | less -S
# exit 0

mkdir /tmp/packages
cd /tmp/packages

for i in {0..8}; do

git clone ssh://aur@aur.archlinux.org/"${names[i]}-git".git "${names[i]}-git"
# git init "${names[i]}-git"
pushd "${names[i]}-git"/
echo -e "*\n!.SRCINFO\n!PKGBUILD" >.gitignore

cat >PKGBUILD <<EOF

# Maintainer: Darren Wu <\$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
pkgname="${names[i]}-git"
pkgver=1
pkgrel=1
pkgdesc="${descs[$i]}"
arch=('any')
url="${urls[$i]}"
license=("${lics[$i]}")
depends=('xilinx-vivado-dummy')
provides=("\${pkgname%-git}")
conflicts=("\${pkgname%-git}")
source=("\${pkgname%-git}::git+https://github.com/Digilent/\${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
	cd "\$srcdir/\${pkgname%-git}"
	if git describe &>/dev/null; then
		printf "%s" "\$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	elif git describe --tags &>/dev/null; then
		printf "%s" "\$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	else
		printf "r%s.%s" "\$(git rev-list --count HEAD)" "\$(git rev-parse --short HEAD)"
fi
}
package() {
	cd "\$srcdir/\${pkgname%-git}"
	mkdir -p "\$pkgdir/usr/share/Digilent/\${pkgname%-git}"
	cp -r * "\$pkgdir/usr/share/Digilent/\${pkgname%-git}"
EOF

if [ "${lics[$i]}" != "unknown" ]; then
cat >>PKGBUILD <<EOF
	mkdir -p "\$pkgdir/usr/share/licenses/\${pkgname%-git}"
	mv "\$pkgdir/usr/share/Digilent/\${pkgname%-git}/License.txt" "\$pkgdir/usr/share/licenses/\${pkgname%-git}"
EOF
fi

echo '}' >>PKGBUILD

makepkg --printsrcinfo >.SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "automatically generated"

popd

done

# exit 0

for i in {0..8}; do
pushd "${names[i]}-git"
makepkg -s --noconfirm
popd
done







