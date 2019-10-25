# oss-git

Some part of the package, not the kernel module, requires GAWK4 (below 5.0) to make properly.

Original Source: <https://aur.archlinux.org/packages/oss-git>.

Fix Compile error with ossdetect with glibc starting with version 2.23 accroding to <http://ossnext.trueinstruments.com/forum/viewtopic.php?t=5855>.

Also added patch from seawright [commented on 2018-07-23 00:08](https://aur.archlinux.org/pkgbase/oss-git/#comment-655283).

See also: <https://forums.gentoo.org/viewtopic-t-1039602-start-0.html>.

## Notes

```bash
makepkg --printsrcinfo > .SRCINFO

git checkout master
git merge --squash bugfix
git commit
```

