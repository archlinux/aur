/* Simple login program for use with ttyd
   Original login does not work well with ttyd

   Build with:
      cc -Wall slogin.c -o slogin -lpam -lpam_misc -lutil

   Elmar Klausmeier, 24-Jul-2020
*/

#include <stdio.h>
#include <stdlib.h>	// for setenv()
#include <security/pam_appl.h>
#include <security/pam_misc.h>
#include <sys/types.h>
#include <sys/time.h>	// for gettimeofday()
#include <sys/wait.h>	// for wait()
#include <pwd.h>	// for getpwnam()
#include <grp.h>	// for initgroups()
#include <errno.h>
#include <utmp.h>	// for logwtmp() + login() + logout()
//#include <utmpx.h>	// for struct utmpx, in Linux utmpx and utmp are the same


extern char **environ;


int main(int argc, char *argv[]) {
	int rc, flag=1;
	struct pam_conv	conv = { misc_conv, NULL };	  // Linux-PAM conversation function
	pam_handle_t *pamh = NULL;
	char *p, username[256], arg0[256], *termenv;
	struct passwd *pwd;
	struct utmp ut;
	struct timeval tv;
	pid_t pid = getpid(), child_pid;


	while (flag) {
		rc = pam_start("login",NULL,&conv,&pamh);
		if (rc != PAM_SUCCESS) {
			printf("%s: pam_start() returned %d = %s\n",
				argv[0],rc,pam_strerror(pamh,rc));
			pam_end(pamh,0);
			return 1;
		}

		rc = pam_authenticate(pamh, 0);
		if (rc != PAM_SUCCESS) {
			pam_get_item(pamh, PAM_USER, (const void**)&p);
			printf("%s: pam_authenticate() for |%s| returned %d = %s\n",
				argv[0],p,rc,pam_strerror(pamh,rc));
			// log in btmp, see log_btmp() in login.c
			memset(&ut, 0, sizeof(ut));
			strncpy(ut.ut_user,p ? p : "(unknown)",UT_NAMESIZE);
			ut.ut_user[UT_NAMESIZE] = '\0';
			strcpy(ut.ut_line,"Hiawatha-ttyd");
			gettimeofday(&tv, NULL);
			ut.ut_tv.tv_sec = tv.tv_sec;
			ut.ut_tv.tv_usec = tv.tv_usec;
			ut.ut_type = LOGIN_PROCESS;
			ut.ut_pid = pid;
			strcpy(ut.ut_host,"Hiawatha-localhost");
			updwtmp("/var/log/btmp", &ut);
		} else {
			rc = pam_get_item(pamh, PAM_USER, (const void**)&p);
			if (rc != PAM_SUCCESS) {
				printf("%s: pam_get_item() returned %d = %s\n",
				argv[0],rc,pam_strerror(pamh,rc));
				pam_end(pamh,0);
				return 2;
			}
			if (p[0] == '\0') return 3;
			if (strlen(p) > 255) return 4;
			strcpy(username,p);
			flag = 0;
		}

		rc = pam_end(pamh, 0);
		if (rc != PAM_SUCCESS) {
			printf("%s: pam_end() returned %d = %s\n",
				argv[0],rc,pam_strerror(pamh,rc));
			return 3;
		}
	}

	printf("username = |%s|\n",username);
	if ((pwd = getpwnam(username)) == NULL) return 4;
	printf("pw_uid = %d, pw_gid = %d, pw_shell = %s\n",
		pwd->pw_uid, pwd->pw_gid, pwd->pw_shell);

	//logwtmp("ttyd",username,"hiawatha");
	memset(&ut, 0, sizeof(ut));
	strncpy(ut.ut_user,username,UT_NAMESIZE);
	ut.ut_user[UT_NAMESIZE] = '\0';
	//strcpy(ut.ut_line,"Hiawatha-ttyd");
	strcpy(ut.ut_line,ttyname(1)+5);
	gettimeofday(&tv, NULL);
	ut.ut_tv.tv_sec = tv.tv_sec;
	ut.ut_tv.tv_usec = tv.tv_usec;
	ut.ut_type = LOGIN_PROCESS;
	ut.ut_pid = pid;
	strcpy(ut.ut_host,"Hiawatha-localhost");
	//updwtmp("/run/utmp", &ut);
	//updwtmp("/var/log/wtmp", &ut);
	login(&ut);	// works well for root
	printf("ut_user=|%s|, ut_line=|%s|, ut_pid=%d, ut_host=|%s|\n",
		ut.ut_user, ut.ut_line, ut.ut_pid, ut.ut_host);

	if ((child_pid = fork()) < 0) {
		printf("%s: cannot fork, %s\n", argv[0],strerror(errno));
		return 4;
	} else if (child_pid > 0) {	// parent
		close(0);
		close(1);
		close(2);
		// wait as long as any child is there
		while (wait(NULL) == -1 && errno == EINTR)
			;
		logout(ut.ut_line);
		return 0;
	}

	// Child
	setsid();	// start new session
	/* Copied from login.c
	 * For root we don't call initgroups, instead we call setgroups with
	 * group 0. This avoids the need to step through the whole group file,
	 * which can cause problems if NIS, NIS+, LDAP or something similar
	 * is used and the machine has network problems.
	 */
	rc = pwd->pw_uid ? initgroups(username, pwd->pw_gid) : setgroups(0, NULL);
	if (rc) {
		printf("%s: initgroups() returned %d, %s\n",
			argv[0], rc, strerror(errno));
		return 8;
	}

	termenv = getenv("TERM");
	environ = calloc(1,sizeof(char*));
	setenv("HOME",pwd->pw_dir,1);
	setenv("USER",pwd->pw_name,1);
	setenv("SHELL",pwd->pw_shell,1);
	setenv("TERM",termenv ? termenv : "dumb",1);

	// First change group, then uid because non-root cannot set group
	if ((rc = setgid(pwd->pw_gid)) != 0) {
		printf("%s: setgid() returned %d, %s\n",
			argv[0], rc, strerror(errno));
		return 9;
	}
	if ((rc = setuid(pwd->pw_uid)) != 0) {
		printf("%s: setuid() returned %d, %s\n",
			argv[0], rc, strerror(errno));
		return 10;
	}

	if ((rc = chdir(pwd->pw_dir)) != 0) {
		printf("%s: chdir(\"%s\") returned %d, %s\n",
			argv[0], pwd->pw_dir, rc, strerror(errno));
		return 11;
	}

	if (strchr(pwd->pw_shell, ' ')) {
		printf("%s: pw_shell=|%s| contains space\n", argv[0], pwd->pw_shell);
		//return 12;
	}
	arg0[0] = '-';
	strncpy(arg0+1,(p = strrchr(pwd->pw_shell,'/')) ? p+1 : pwd->pw_shell,254);
	arg0[255] = '\0';
	execl(pwd->pw_shell,arg0,NULL);

	return 0;	// never reached after execl()
}

