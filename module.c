// hotfix-kvadra-touchpad
//
// This kernel module provides a hotfix for touchpad issues
// KVADRA NAU LE14U and similar notebooks.
//
// See README.md for details
//
// Copyright (C) 2025 and up by Alexander Pevzner (pzz@apevzner.com)
// See LICENSE for license terms and conditions

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>
#include <linux/atomic.h>
#include <linux/interrupt.h>
#include <linux/dmi.h>
#include <linux/pci.h>
#include <linux/pci_ids.h>

// Hardcoded parameters:
//
//   MODULE_NAME        - name, used for logging etc
//   MODULE_PROCFS_NAME - name, used by /proc entry
//   MODULE_IRQ_NAME    - name, listed in /proc/interrupts
#define MODULE_NAME             "hotfix-kvadra-touchpad"
#define MODULE_PROCFS_NAME      MODULE_NAME
#define MODULE_IRQ_NAME         MODULE_NAME

// i2c_controller contains information on each detected I2C controller.
typedef struct {
    int      irq;       // IRQ in use
    atomic_t isr_count; // ISR invocation count
} i2c_controller;

// I2C_CONTROLLER_MAX defines size limits for the I2C controller list.
//
// Typical system contains 4-6 of such controllers, so 16 must be enough...
#define I2C_CONTROLLER_MAX      16

// i2c_controller_list contains list of detected I2C controllers.
// i2c_controller_count contains usage count.
static i2c_controller i2c_controller_list[I2C_CONTROLLER_MAX];
static int            i2c_controller_count;

// i2c_controller_detect detects I2C controllers in the
// system and populates i2c_controller_list.
//
// Returns 0 on success, -errno on a error.
static int
i2c_controller_detect (void)
{
    struct pci_dev *dev = pci_get_device(PCI_VENDOR_ID_INTEL, PCI_ANY_ID, NULL);

    pr_info(MODULE_NAME ": I2C controllers detected:\n");

    while (dev != NULL) {
        switch (dev->device) {
        // KVADRA uses the following device IDs with its controllers.
        case 0x51e8:
        case 0x51e9:
        case 0x51c5:
        case 0x51c6:
            pr_info("  PCI: %4.xx:%4.x IRQ %d\n",
                dev->vendor, dev->device, dev->irq);

            i2c_controller_list[i2c_controller_count].irq = dev->irq;
            i2c_controller_count ++;

            if (i2c_controller_count == I2C_CONTROLLER_MAX) {
                return -ENOBUFS;
            }
            break;
        }

        dev = pci_get_device(PCI_VENDOR_ID_INTEL, PCI_ANY_ID, dev);
    }

    return 0;
}

// irq_handler is the interrupt service routine that this module installs
// for each detected I2C controller.
static irqreturn_t
irq_handler (int, void *p)
{
    i2c_controller *c = p;
    atomic_inc(&c->isr_count);
    return IRQ_HANDLED;
}

// release_interrupts releases interrupts listed in the i2c_controller_list
// up to the specified count.
static void
release_interrupts (int count)
{
    int i;

    for (i = 0; i < i2c_controller_count; i ++) {
        i2c_controller *c = &i2c_controller_list[i];
        free_irq(i2c_controller_list[i].irq, c);
    }
}

// hook_interrupts installs ISR for each I2C controller listed in the
// i2c_controller_list.
//
// Returns 0 on success, -errno on a error.
static int
hook_interrupts (void)
{
    int i;

    for (i = 0; i < i2c_controller_count; i ++) {
        i2c_controller *c = &i2c_controller_list[i];
        int            rc;

        rc = request_irq(c->irq, irq_handler, IRQF_SHARED, MODULE_IRQ_NAME, c);
        if (rc < 0) {
            release_interrupts(i);
            return rc;
        }
    }

    return 0;
}

// proc_show handles read from the /proc entry
static int
proc_show(struct seq_file *m, void *v)
{
    int i;

    for (i = 0; i < i2c_controller_count; i ++) {
        i2c_controller *c = &i2c_controller_list[i];
        seq_printf(m, "IRQ %d: %d\n", c->irq, atomic_read(&c->isr_count));
    }

    return 0;
}

// mod_init implements module initialization.
static int mod_init(void)
{
    struct proc_dir_entry *ent;
    int                   rc;
    const char            *s;

    // Write log messages
    pr_info(MODULE_NAME ": loaded\n");

    s = dmi_get_system_info(DMI_SYS_VENDOR);
    if (s != NULL) {
        pr_info("  System Vendor:  %s", s);
    }

    s = dmi_get_system_info(DMI_PRODUCT_NAME);
    if (s != NULL) {
        pr_info("  Product name:,  %s", s);
    }

    s = dmi_get_system_info(DMI_BOARD_NAME);
    if (s != NULL) {
        pr_info("  Board Name:     %s", s);
    }

    // Detect I2C controllers
    rc = i2c_controller_detect();
    if (rc < 0) {
        return rc;
    }

    // Crete /proc entry
    ent = proc_create_single(MODULE_PROCFS_NAME, 0644, NULL, proc_show);
    if (ent == NULL) {
    	return -ENOENT;
    }

    // Hook interrupts
    rc = hook_interrupts();
    if (rc < 0) {
        remove_proc_entry(MODULE_PROCFS_NAME, NULL);
        return rc;
    }

    pr_info(MODULE_NAME ": initialized\n");

    return 0;
}

// mod_init implements module cleanup.
static void mod_exit(void)
{
    release_interrupts(i2c_controller_count);
    remove_proc_entry(MODULE_PROCFS_NAME, NULL);
    pr_info(MODULE_NAME ": removed\n");
}

// Module description
MODULE_LICENSE("GPL");
MODULE_AUTHOR("Alexander Pevzner");
MODULE_DESCRIPTION("Touchpad hotfix for KVADRA NAU LE14U and similar");

module_init(mod_init);
module_exit(mod_exit);

// vim:ts=8:sw=4:et
