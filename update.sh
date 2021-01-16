#!/usr/bin/env bash

ROOT_DIR="${HOME}/packaging/AUR/gitui-git"

if [[ ! -d "${ROOT_DIR}" ]]; then
	mkdir -p "${ROOT_DIR}"
fi

cd "${ROOT_DIR}"

package_version=$(grep "^pkgver" PKGBUILD | cut -d '=' -f 2)
package_release=$(grep "^pkgrel" PKGBUILD | cut -d '=' -f 2)

makepkg --printsrcinfo > .SRCINFO && git commit -am "Update to v. ${package_version}-${package_release}" && git push origin master
