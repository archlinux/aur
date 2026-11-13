# LibreWolf

## PGO profiling conflicting with Firefox

The PGO profiling of our `librewolf` and `firefox` packages conflicts with each other. As such, both packages cannot be built at the same time on the same machine (e.g. the build server), otherwise one of the build with failed with an "address already in use" error.

As such, make sure that a `firefox` build is not currently running on the build server before building `librewolf` (note that ongoing package builds running on the build server can be listed with `check-builds` command provided by the `archlinux-contrib` package).

## Custom `pkgver` setup

Despite what the [Firefox release page is showing](https://www.firefox.com/en-US/releases/), Firefox "round" releases do not actually contain a trailing `.0` as a third digit. For instance, the `154.0.0` release shown on the website actually doesn't exists, the actual matching upstream version / tag is `154.0` (see the [corresponding update for our Firefox package](https://gitlab.archlinux.org/archlinux/packaging/packages/firefox/-/commit/635083cfc15fcb3b56bc7fb537742805afaf4711)). Non "round" release are actually using the expected scheme though (for instance, `154.0.1`).

The LibreWolf version scheme is `$Firefox_version-LibreWolf_release`. For instance, for the first release of LibreWolf based on the `154.0` Firefox version, the matching LibreWolf version will be `154.0_1` (actually `154.0-1` but we have to replace the hyphen by an underscore to produce a valid `pkgver`). Consequently, the second LibreWolf release based on the `154.0.1` Firefox release will be `154.0.1_2`.

Given Firefox's arguable version scheme for "round" releses, that unfortunately causes issues in term of version comparison, since whatever is after the underscore will always take the precedent. For instance, `154.0_2` (second LibreWolf release based on the `154.0` Firefox version) is seen as newer than `154.0.1_1` (first LibreWolf release based on the `154.0.1` Firefox version):

```bash
$ vercmp 154.0_2 154.0.1_1
1
```

This can result in unexpected version comparison issue, eventually forcing the implementation (or the increment) of an epoch:

```
"warning: librewolf: local (154.0_2-1) is newer than extra-testing (154.0.1_2-1)"
```

To work around this issue, we therefore have to add the "missing" trailing `.0` for round releases, in order to ensure a coherent version comparison logic. As such, the `155.0_1` LibreWolf version should instead be `155.0.0_1` as a `pkgver` in our package for instance.  
The PKGBUILD "re-computes" the `pkgver` to match the actual upstream version scheme in a custom `_pkgver` variable automatically, which is used in the source array.

This also act as safeguard: A `pkgver` missing the required trailing `.0` third digit for "round" releases (e.g. `155.0_1`) will result in a wrong `_pkgver` variable, preventing sources from being downloaded. If you face non-existing sources when trying to fetch them, this is most likely the issue.  
**Do not** try to fix it directly in the source array, or you will likely expose the package update to the above version comparison problem. Instead, just add a trailing `.0` as a third digit for "round" release (e.g. `155.0.0_1`).

For extra safety, there's also a `pkgver()` function ensuring that the `pkgver` contains a trailing `.0` third digit for "round" releases.

The `.nvchecker.toml` configuration has also been updated to reflect this custom `pkgver` setup, so `pkgctl version check` / `pkgctl version upgrade` should correctly produce the expected `pkgver`. Note that it relies on the nvchecker `jq` source so you need to have the `python-jq` package installed (optional dependency for `nvchecker`).
