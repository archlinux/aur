# Update instructions

- Update version and sha256sums
- Run `makepkg --printsrcinfo > .SRCINFO`
- Commit, with meaningful message. Make sure .SRCINFO is commited 
- Push

OR 

Run: 
```bash
./update-to-latest.sh
```

# To build package

Run: `makepkg`