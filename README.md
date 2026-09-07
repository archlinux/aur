# AUR Maintenance Commands

Whenever you push new commits to your GitHub repository:

```bash
cd ~/development/kotsasmin-toolkit-git
makepkg -od
makepkg --printsrcinfo > .SRCINFO
git commit -am "Update version"
git push origin master
```
