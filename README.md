You need install and configure provider first. 

Please pay attention - not all providers support [bisync](https://rclone.org/bisync/#limitations) functionality yet!  

After install package need some initialization with:
```bash
rclone-bisync-init.sh name
```
Where name is name of your provider. This makes creates folder `~/rclone-bisync/name`, put content from your remote and create index of that file.

After indexing you have to start timer and path, to syncronyze in background with:
```bash
systemctl --user daemon-reload
systemctl --user enable rclone-bisync@name.{path,timer}
```

In case if you don't need offline access to file use bundled `rclone@name.service`. 

Credits: 
- notnout - https://raw.githubusercontent.com/notnout/tutorials/refs/heads/main/Rclone%20bisync%20Google%20Drive.md
- kabili207 - https://gist.github.com/kabili207/2cd2d637e5c7617411a666d8d7e97101
