subuid-register
=======

A simple tool to let user to register subuid / subgid range.

```
$ subuid-register -q  # query subuid / subgid range
Subuid does not exist
Subgid does not exist
$ subuid-register     # register for the current user (returns subuid / subgid range)
username:713097216:65536
username:713097216:65536
$ subuid-register
Subuid exists
Subgid exists
$ subuid-register -q
username:713097216:65536
username:713097216:65536
```
