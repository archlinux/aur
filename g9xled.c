#include <stdio.h>
#include <string.h>
#include <usb.h>

#define G9X_VENDOR_ID   0x046d
#define G9X_PRODUCT_ID  0xc066

unsigned int get_hex4(unsigned char *p)
{
    return (*p > '9' ? *p - 'A' + 10 : *p - '0') & 15;
}

unsigned int get_hex8(unsigned char *p)
{
    return (get_hex4(p) << 4) + get_hex4(p+1);
}

int is_hex(unsigned char *hex)
{
    char buf[7] = {0};  

    return (strtok(strncpy(buf, hex, sizeof(buf)), "0123456789ABCDEFabcdef") == NULL);
}
                    
static void change_color(struct usb_dev_handle *handle, unsigned char *color)
{
    unsigned char usb_data[] = { 0x10, 0x00, 0x80, 0x57, 0x00, 0x00, 0x00 };

    usb_data[4] = get_hex8(color);
    usb_data[5] = get_hex8(color+2);
    usb_data[6] = get_hex8(color+4);

    usb_control_msg(handle, 0x34, 0x9, 0x210, 0x01, (char*)usb_data, 0x7, 5000);
}

static struct usb_device *device_init(void)
{
    struct usb_bus *usb_bus;
    struct usb_device *dev;

    usb_init();
    usb_find_busses();
    usb_find_devices();

    for (usb_bus = usb_busses; usb_bus; usb_bus = usb_bus->next) {
        for (dev = usb_bus->devices; dev; dev = dev->next) {
            if ((dev->descriptor.idVendor == G9X_VENDOR_ID) && (dev->descriptor.idProduct == G9X_PRODUCT_ID))
        	return dev;
        }
    }
    return NULL;
}

int main(int argc, char **argv)
{
    struct usb_device *usb_dev;
    struct usb_dev_handle *usb_handle;
    int retval = 1;
    
    usb_dev = device_init();
    if (usb_dev == NULL) {
        fprintf(stderr, "Device not found!\n");
        goto exit;
    }

    usb_handle = usb_open(usb_dev);
    if (usb_handle == NULL) {
        fprintf(stderr, "Unable to open USB device!\n");
        goto exit;
    }

    if ((argc != 2) || (strlen(argv[1]) != 6) || !is_hex(argv[1])) {
        fprintf(stderr, "Specify color in RRGGBB hexa form!\n");
        goto exit;
    } 

    change_color(usb_handle, argv[1]);
    retval = 0;

exit:
    usb_close(usb_handle);
    return retval;
}

