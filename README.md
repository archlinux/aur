
# Tasker

A Simple crate which provides a service and a configuration API for genrating commands based tasks ,on time basis.




## Installation
### build from source

```install libthemis on your system
   clone the repository
   ./build.sh
```



## example, start the service:


```
./install.sh
will solve dependencies and start the service

```
## example, add new task:


```
taskerctl add -n freshtheclam -s nu -c "freshclam" -t 40 -u 22

OR

taskerctl help to view all main options

OR

taskerctl add --help, to view all available flags for new tasks

```
## configure root tasker
done automatically, by running ./install.sh


## Features

- encrypted tasks database with the help of GNOME/KDE keyrings (in none root mode)
- every task is kept in log with detailed info, and output
- uses parallel computation when needed, for speed and accuracy.
- currently only tested on linux, in the near future will be added support for other platforms

## Notice

currently the crate is in development stage and is very likely to get updates on daily basis, until we reach stability. 

# roadmap
- [x]  working prototype
- [x]  add option for execution as root
- [ ]  easier installation
- [ ]  GUI interface
- [ ]  better documentation