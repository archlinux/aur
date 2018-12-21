/**
 *   Core HAVEGE Driver
 *   Copyright (C) 2018 Leonardo Gates
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License along
 *   with this program; if not, write to the Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#include <linux/version.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/slab.h>
#include <linux/cdev.h>
#include <linux/uaccess.h>
#include <linux/semaphore.h>
#include <linux/kthread.h>
#include <linux/random.h>
#include <asm/msr.h>

/***********************
 *  Driver Constants   *
 ***********************/

#define DRIVER_AUTH					"Leonardo Gates <leogx9r>"
#define DRIVER_DESC					"Extracts entropy from the system using the HAVEGE algorithm"
#define DRIVER_NAME					"havege"
#define DRIVER_VERS					"1.00"

#define DRIVER_MAJOR				1
#define DRIVER_MINOR				0

#define KERROR						KERN_ERR DRIVER_NAME ": "
#define KNOTICE						KERN_NOTICE DRIVER_NAME ": "

/************************
 *  Driver Char Device  *
 ************************/

/* Bytes to transfer at a time. */
#define CHUNK_TRANSFER_SZ			512
/* Number of words in the pool. */
#define HAVEGE_POOL_WORDS			0x40000
/* Number of bytes in the pool. */
#define HAVEGE_POOL_SIZE			( ( HAVEGE_POOL_WORDS + 16384 ) * sizeof( u32 ) )
/* Size of the walking table in bytes. */
#define WALK_TABLE_SIZE				( 8192 * sizeof( u32 ) )

static ssize_t	havege_read( struct file* pfile, char __user* buf, size_t length, loff_t* fpos );
static int		havege_open( struct inode* inode, struct file* pfile );

static struct class*				havege_class;
static dev_t						havege_dev;

static u32							transfer_buffer[ CHUNK_TRANSFER_SZ ] __latent_entropy;

static int							havege_init_steps		= 64;
static int							havege_reseed_steps		= 64;

static struct file_operations		havege_fops				= {
	.owner													= THIS_MODULE,
	.open													= havege_open,
	.read													= havege_read,
};

/*************************
 * HAVEGE Algorithm Base *
 *************************/

struct havege_state {
	/* Pointer to the current word being read from the pool. */
	u32						pidx;
	/* Array of words containing result information. */
	u32*					pool;
	/* Size in words of the result pool. */
	ssize_t					pool_size;

	/* Table walking. */
	u32*					walk_tbl;
	u32*					walk_ptr;

	/* Permuting values. */
	u32						P1[2];
	u32						P2[2];

	/* Timing information. */
	u32						clock;
	u32						freq;

	/* Device information. */
	struct semaphore		lock;
	struct cdev				dev;

} __randomize_layout;

static struct havege_state*	cstate;

/**
  * Collects timing information from the system and adds it to the state.
  */
static void havege_collect( struct havege_state* state ) {
	u32 i, j, k, flags, *pt[4], *tmp;

	i		= 0;
	k		= 0;

	/* Update each word in the state. */
	while( i < state->pool_size ) {
		/* Do we force preemption now ? */
		if( ( i - k ) >= state->freq ) {
			k = i;
			schedule();
		}

		/* Schedule when necessary. */
		if( need_resched() )
			schedule();

		/* Perform the main loop. */
		#include "body.h"
	}
}

/**
  * Cleans up any state allocated information.
  */
static void havege_cleanup( struct havege_state* state ) {
	if( !state )
		return;

	/* Zero the walking table and free it if allocated. */
	if( state->walk_tbl ) {
		memzero_explicit( state->walk_tbl, WALK_TABLE_SIZE );
		vfree( state->walk_tbl );
	}

	/* Zero out the pool and free it if allocated. */
	if( state->pool ) {
		memzero_explicit( state->pool, HAVEGE_POOL_SIZE );
		vfree( state->pool );
	}

	/* Finally free the kernel memory. */
	memzero_explicit( state, sizeof( struct havege_state ) );
	kfree( state );
}

/**
  * Sets up a state structure for collection.
  */
static struct havege_state* havege_setup( u32 pool_size ) {
	struct havege_state* state;

	/* Allocate the actual state in the kernel. */
	state = kmalloc( sizeof( struct havege_state ), GFP_KERNEL );
	if ( !state ) {
		printk( KERROR "failed to allocate initial state\n" );
		return NULL;
	}

	/* Zero out everything. */
	memset( state, 0, sizeof( struct havege_state ) );

	/* By default, we point the pool here to schedule an initial run. */
	state->pidx = HAVEGE_POOL_WORDS * 2;

	/* And store the pool size. */
	state->pool_size = pool_size;

	/* Allocate the entire pool + 64k in virtual memory since we may not have enough kmem. */
	state->pool = vmalloc( HAVEGE_POOL_SIZE );
	if( !state->pool ) {
		printk( KERROR "failed to allocate pool table for state\n" );
		goto __bail_out;
	}

	/* Also allocate the walk table ( 32k ) virtually. */
	state->walk_tbl = vmalloc( WALK_TABLE_SIZE );
	state->walk_ptr = state->walk_tbl;
	if( !state->walk_tbl ) {
		printk( KERROR "failed to allocate walk table for state\n" );
		goto __bail_out;
	}

	/* And initialize the semaphore. We allow one read at a time. */
	sema_init( &state->lock, 1 );
	if( &state->lock == NULL ) {
		printk( KERROR "failed to initialize semaphore lock for state\n" );
		goto __bail_out;
	}

	/* Preemption refills the pool roughly 1/16th tick. */
	state->freq = pool_size >> 4;

	return state;


__bail_out:

	/* Cleanup allocated memory if any. */
	havege_cleanup( state );

	printk( KERROR "unable to allocate resources required\n" );
	return NULL;
}

/**
  * Extracts a word from the state.
  * Updates the state internally prior to extraction if required.
  */
static inline u32 havege_extract( void ) {
	u32 i, steps;

	/* Do we need to regather entropy ? */
	if( cstate->pidx >= cstate->pool_size ) {
		/* Perform initial gathering if required. */
		if( cstate->pidx >= cstate->pool_size * 2 ) {
			cstate->walk_ptr = ( u32* )( ( ( unsigned long long )&cstate->walk_tbl[ 4096 ] ) & 0xfffffffffffff000 );

			steps = ( havege_init_steps * HAVEGE_POOL_WORDS ) / cstate->pool_size;

			for( i = 0; i < steps; i++ )
				havege_collect( cstate );
		}
		/* Normal sequential stepping. */
		else for( i = 0; i < havege_reseed_steps; i++ )
			havege_collect( cstate );

		cstate->pidx = 0;
	}

	/* Return the next word. */
	return cstate->pool[ cstate->pidx++ ];
}

/*************************
 *    Device Methods     *
 *************************/

/**
  * Poll the state for entropy and transfer it to the user.
  */
static ssize_t havege_read( struct file* pfile, char __user* buf, size_t length, loff_t* fpos ) {
	ssize_t sz;
	u32 i, j;

	sz = length;

	/* Try acquiring the lock. */
	if( down_interruptible( &cstate->lock ) )
		return -ERESTARTSYS;

	/* We're copying to the user in chunks. */
	while( length > 0 ) {
		i = min_t( u32, CHUNK_TRANSFER_SZ, length / sizeof( u32 ) );

		/* Fill up the buffer. */
		for( j = 0; j < i; j++ )
			transfer_buffer[ j ] = havege_extract();

		/* Try transferring to the user. Bail out if we can only do a partial transfer. */
		if( copy_to_user( buf, transfer_buffer, i * sizeof( u32 ) ) ) {
			sz = -EFAULT;
			goto __bail_out;
		}

		length -= i * sizeof( u32 );
		buf += i * sizeof( u32 );
	}

	fpos += sz;

__bail_out:

	/* Clear out sensitive memory and release the lock. */
	memzero_explicit( transfer_buffer, sizeof( transfer_buffer ) );
	up( &cstate->lock );

	return sz;
}

/**
  * When opening the device, ensure we're only doing read operations.
  */
static int havege_open( struct inode* inode, struct file* pfile ) {
	/* Only allow reading from the device. */
	if( !( pfile->f_mode & FMODE_READ ) || pfile->f_mode & FMODE_WRITE )
		return -EINVAL;

	pfile->f_op = &havege_fops;
	return 0;
}

/**************************
 *     Module Methods     *
 **************************/

/**
  * Allocates and initializes the internal state and character device.
  */
static int module_do_init( void ) {
	int res;

	/* Allocate the character device for usage. */
	res = alloc_chrdev_region( &havege_dev, DRIVER_MINOR, DRIVER_MAJOR, DRIVER_NAME );
	if( res < 0 ) {
		printk( KERROR "failed to register character device\n" );
		return res;
	}

	/* Register the device class. */
	havege_class = class_create( THIS_MODULE, DRIVER_NAME );
	if( IS_ERR( havege_class ) ) {
		printk( KERROR "failed to create device class\n" );
		return PTR_ERR( havege_class );
	}

	/* Set up the internal state. */
	cstate = havege_setup( HAVEGE_POOL_WORDS );
	if( !cstate )
		return -ENOMEM;

	/* Initialize the character device. */
	cdev_init( &cstate->dev, &havege_fops );
	cstate->dev.owner = THIS_MODULE;
	cstate->dev.ops   = &havege_fops;

	/* Add the device internally. */
	res = cdev_add( &cstate->dev, havege_dev, 1 );
	if( res ) {
		printk( KERROR "failed to add character device\n" );
		return -EFAULT;
	}

	/* Link and mark it ready for usage. */
	device_create( havege_class, NULL, havege_dev, NULL, DRIVER_NAME );
	kobject_set_name( &cstate->dev.kobj, DRIVER_NAME );

	printk( KNOTICE "created character device\n" );
	return 0;
}

/**
  * Cleans up any allocated memory and removes the character device.
  */
static void module_do_exit( void ) {
	/* free character device */
	cdev_del( &cstate->dev );
	unregister_chrdev_region( havege_dev, DRIVER_MAJOR );

	/* remove & destroy class object */
	device_destroy( havege_class, havege_dev );
	class_destroy( havege_class );

	/* destroy state */
	havege_cleanup( cstate );

	printk( KNOTICE "removed from kernel.\n" );
}

/**************************
 *     Driver Exports     *
 **************************/

module_init( module_do_init );
module_exit( module_do_exit );

module_param_named( init_steps, havege_init_steps, int, 0 );
MODULE_PARM_DESC( init_steps, "inital steps to run when reseeding. default: 64" );

module_param_named( reseed_steps, havege_reseed_steps, int, 0 );
MODULE_PARM_DESC( reseed_steps, "number of steps to use during reseeding. default: 64" );

MODULE_LICENSE( "GPL" );
MODULE_AUTHOR( DRIVER_AUTH );
MODULE_DESCRIPTION( DRIVER_DESC );
MODULE_VERSION( DRIVER_VERS );