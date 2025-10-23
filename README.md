### Uploading to AUR

From `tufw` repo, run goreleaser in sandbox mode: 

```
goreleaser release --clean --skip=validate,publish
```

It will generate `dist/` folder from where you can pickup `aur/tufw-bin.pkgbuild` file.
Be sure to rename it:

-> `pkgname='tufw-git'`

Then regenerate `.SRCINFO`: 

```
makepkg --printsrcinfo > .SRCINFO
```

Commit and push to AUR

```
git add -u
git commit
git push origin master
```