# ansible-language-server

## Versioning history and general explanations about the PKGBUILD

The Ansible language server used to have its [own repository](https://github.com/ansible/ansible-language-server) but, at some point, upstream dediced to archive it and merge it into their [vscode plugin repository](https://github.com/ansible/vscode-ansible/issues/1134).

The ansible-language-server specific files are still accessible in a [separate directory](https://github.com/ansible/vscode-ansible/tree/main/packages/ansible-language-server) in the vscode-ansible repo but upstream did not implement a separate tagging for it, making the packaging of the language server itself (meaning not including the whole vscode plugin) more difficult.  
A [request has been made](https://github.com/ansible/vscode-ansible/discussions/1243) to upstream in order to impletement a separate versioning for ansible-language-server, however we have no ETA as of now (neither an actual confirmation that this will happen at some point).

In the mean time, we got the [nvchecker integration](https://gitlab.archlinux.org/archlinux/packaging/packages/ansible-language-server/-/blob/main/.nvchecker.toml?ref_type=heads) looking for ansible-language-server new releases via the [npm registry](https://www.npmjs.com/package/@ansible/ansible-language-server) (which has specific releases/versioning for it). The lack of tagging on the source repo side forces us to use a `_commit` mechanism in the PKGBUILD to point to the commit that bumped the version of ansible-language-server in the associated [package.json file](https://github.com/ansible/vscode-ansible/blob/main/packages/ansible-language-server/package.json), matching the version from the npm registry (you can use `View git blame` on the "version" line of the package.json file in GitHub to see which upstream commit bumped it).

Unfortunately, the lack of tagging in the upstream repo for the Ansible language server itself also prevents us to add the usual `pkgver()` verification mechanism (e.g. verify that `$_commit` indeed points to the commit used for the tag that matches `$pkgver`) but, in the current state of things, this is probably the best we can come up with.

## Updating the package

- Look for new releases in the [npm registry](https://www.npmjs.com/package/@ansible/ansible-language-server?activeTab=versions) (`.nvchecker.toml` is set up to follow this source)
- Update `$pkgver` (and `$pkgrel` if needed) accordingly
- Retrieve the upstream commit that updated the version matching the one from the npm registry in the associated [package.json](https://github.com/ansible/vscode-ansible/blob/main/packages/ansible-language-server/package.json) file (from GitHub, select the line containing the version and click `View git blame` to retrieve it) and update `$_commit` accordingly
- Update checksums (e.g. by running `updpkgsums`, from the `pacman-contrib` package)
