/* SPDX-License-Identifier: GPL-3.0-or-later
 * Test-only X transport for environments that permit socketpair IPC but prohibit
 * socket listeners. Real X11 requests still go to Xvfb. Each client passes its
 * socket peer to the server using SCM_RIGHTS; no network ports are opened.
 */
#define _GNU_SOURCE
#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <dlfcn.h>
#include <errno.h>
static int listener=-1;
static int peers[4096];
static int broker(void) { const char *s=getenv("SBXKB_TEST_BROKER"); return s?atoi(s):-1; }
static int server(void) { return getenv("SBXKB_TEST_SERVER")!=NULL; }
int socket(int domain,int type,int protocol) {
 int (*real)(int,int,int)=dlsym(RTLD_NEXT,"socket");
 if(domain!=AF_UNIX || broker()<0) return real(domain,type,protocol);
 if(server()) {listener=dup(broker());return listener;}
 int pair[2]; if(socketpair(AF_UNIX,type,0,pair)<0)return -1;
 if(pair[0]>=4096){close(pair[0]);close(pair[1]);errno=EMFILE;return -1;}
 peers[pair[0]]=pair[1]+1;return pair[0];
}
int bind(int fd,const struct sockaddr *addr,socklen_t len) {
 int (*real)(int,const struct sockaddr*,socklen_t)=dlsym(RTLD_NEXT,"bind");
 return server()&&fd==listener?0:real(fd,addr,len);
}
int listen(int fd,int n) {
 int (*real)(int,int)=dlsym(RTLD_NEXT,"listen");
 return server()&&fd==listener?0:real(fd,n);
}
int connect(int fd,const struct sockaddr *addr,socklen_t len) {
 int (*real)(int,const struct sockaddr*,socklen_t)=dlsym(RTLD_NEXT,"connect");
 if(server()||broker()<0||fd>=4096||!peers[fd])return real(fd,addr,len);
 int peer=peers[fd]-1;peers[fd]=0;
 char c='X',control[CMSG_SPACE(sizeof(int))];struct iovec iov={&c,1};
 struct msghdr msg={.msg_iov=&iov,.msg_iovlen=1,.msg_control=control,.msg_controllen=sizeof control};
 memset(control,0,sizeof control);struct cmsghdr *cm=CMSG_FIRSTHDR(&msg);
 cm->cmsg_level=SOL_SOCKET;cm->cmsg_type=SCM_RIGHTS;cm->cmsg_len=CMSG_LEN(sizeof(int));
 memcpy(CMSG_DATA(cm),&peer,sizeof peer);
 int result=sendmsg(broker(),&msg,0);close(peer);return result==1?0:-1;
}
static int receive(int fd,struct sockaddr *addr,socklen_t *len) {
 char c,control[CMSG_SPACE(sizeof(int))];struct iovec iov={&c,1};
 struct msghdr msg={.msg_iov=&iov,.msg_iovlen=1,.msg_control=control,.msg_controllen=sizeof control};
 if(recvmsg(fd,&msg,0)!=1)return -1;
 struct cmsghdr *cm=CMSG_FIRSTHDR(&msg);if(!cm){errno=EAGAIN;return -1;}
 int client;memcpy(&client,CMSG_DATA(cm),sizeof client);
 if(addr&&len){struct sockaddr_un un={.sun_family=AF_UNIX};socklen_t n=*len<sizeof un?*len:sizeof un;memcpy(addr,&un,n);*len=sizeof un;}
 return client;
}
int accept(int fd,struct sockaddr *addr,socklen_t *len) {
 int (*real)(int,struct sockaddr*,socklen_t*)=dlsym(RTLD_NEXT,"accept");
 return server()&&fd==listener?receive(fd,addr,len):real(fd,addr,len);
}
int accept4(int fd,struct sockaddr *addr,socklen_t *len,int flags) {
 int (*real)(int,struct sockaddr*,socklen_t*,int)=dlsym(RTLD_NEXT,"accept4");
 return server()&&fd==listener?receive(fd,addr,len):real(fd,addr,len,flags);
}
