/*
 *	Fancy beeper driver for Linux
 *
 *	Copyright (c) 2024	Robin Becker
 *
 *	Based on github https://github.com/mozzwald/Fancy-Beeper-Daemon
 */

/* Kernel includes */
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/input.h>
#include <linux/sched.h>
#include <asm/siginfo.h>    //siginfo
#include <linux/rcupdate.h> //rcu_read_lock
#include <linux/sched.h>    //find_task_by_pid_type
#include <linux/kthread.h>    // included for threading related functions
#include <asm/io.h>
#include <linux/spinlock.h>
#include <linux/moduleparam.h>

#define SIGUSR1 10
#define	SIGTERM 15

/* Static data */
static DECLARE_WAIT_QUEUE_HEAD (beep_wait);
static char what_beep = 0;
// array for task_struct to hold task info
static struct task_struct kth;
static struct task_struct *pkth=&kth;
static int data;

static pid_t helper_pid = 0;
static int debug = 0;
module_param(helper_pid,int,0660);
module_param(debug,int,0660);

MODULE_AUTHOR("Robin Becker lt becker dot rg at gmail dot com gt");
MODULE_DESCRIPTION("Alsa Beep Driver");
MODULE_LICENSE("GPL");

static char beep_name[] = "alsabeep";
static struct input_dev *beep_dev;

static int my_kill(pid_t pid, int sig){
	// this code is from https://stackoverflow.com/questions/31646466/how-to-send-signal-from-kernel-to-user-space
	struct kernel_siginfo info;
	struct task_struct *t;
	int r=0;

	memset(&info, 0, sizeof(info));
	info.si_signo = sig;
	// This is bit of a trickery: SI_QUEUE is normally used by sigqueue from user space,    and kernel space should use SI_KERNEL. 
	// But if SI_KERNEL is used the real_time data  is not delivered to the user space signal handler function. */
	info.si_code = SI_QUEUE;
	// real time signals may have 32 bits of data.
	info.si_int = 1234; // Any value you want to send
	rcu_read_lock();
	// find the task with that pid
	t = pid_task(find_pid_ns(pid, &init_pid_ns), PIDTYPE_PID);
	if(debug) printk(KERN_INFO "alsabeep:my_kill: pid=%d sif=%d t @ %p\n",pid,sig,t);
	if (t != NULL) {
		rcu_read_unlock();      
		if (send_sig_info(sig, &info, t) < 0) { // send signal
			if(debug) printk(KERN_WARNING "alsabeep:my_kill(%d, %d)  error\n",pid,sig);
			r = 1;
		}
	} else {
		rcu_read_unlock();
		if(debug) printk(KERN_WARNING "alsabeep:my_kill(%d, %d) pid_task error\n",pid,sig);
		//return -ENODEV;
		r = 1;
	}
	return r;
}

// long running function to be executed inside a thread
static int wait_for_beep_event(void *data) {
	// kthread_should_stop call is important.
	while (!kthread_should_stop()) {
		while(1){
			if (!wait_event_interruptible(beep_wait, what_beep)) {
				if(debug) printk(KERN_INFO "alsabeep:wait_for_beep_event: wakes what_beep=%d helper_pid=%d\n", what_beep, helper_pid);
				while (what_beep>0) {
					if (helper_pid){
						//if signal failure we abandon this helper
						if(my_kill(helper_pid, SIGUSR1)) helper_pid = 0;
					} else if(debug) printk(KERN_WARNING "alsabeep:wait_for_beep_event: what_beep=%d helper_pid=%d\n", what_beep, helper_pid);
					what_beep--;
				}
			}
		}
	}
	return 0;
}

static int beep_event(struct input_dev *dev, unsigned int type,
						unsigned int code, int value)
{
	if (type != EV_SND)
		return -1;

	switch (code) {
	case SND_BELL: if (value) value = 1000;
	case SND_TONE: break;
	default: return -1;
	}
	if(debug) printk(KERN_WARNING "beep_event called with %d %d %d\n", type, code, value);

	if (value && helper_pid) {
		what_beep += 1;
		wake_up(&beep_wait);
	}
	return 0;
}

static int __init mod_init(void){
	int ret = 0;
	beep_dev = input_allocate_device();

	beep_dev->evbit[0] = BIT(EV_SND);
	beep_dev->sndbit[0] = BIT(SND_BELL) | BIT(SND_TONE);
	beep_dev->event = beep_event;
	beep_dev->name = beep_name;

	ret = input_register_device(beep_dev);
	if(ret){
		if(debug) printk(KERN_INFO "Unable to register beep device\n");
		my_kill(helper_pid, SIGUSR1);
		return ret;
	}

	if(debug) printk(KERN_INFO "input: %s phys=%s\n", beep_name, beep_dev->phys);

  	pkth = kthread_create(wait_for_beep_event, &data, "wait_for_beep_event");
  	if (pkth != NULL) {
    	wake_up_process(pkth);
    	if(debug) printk(KERN_INFO "wait_for_beep_event thread started\n");
  	} else {
    	if(debug) printk(KERN_INFO "kthread wait_for_beep_event thread could not be created\n");
    	return -1;
  	}

	return 0;
}

static void __exit mod_exit(void)
{
	if(debug) printk(KERN_INFO "exit alsabeep helper_pid=%d\n", helper_pid);
	if (helper_pid) {
		my_kill(helper_pid, SIGTERM);
	}
	input_unregister_device(beep_dev);
}

module_init(mod_init);
module_exit(mod_exit);
