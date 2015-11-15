#include <iostream>
#include <memory>
#include <functional>
#include <cstring>

#include <libusb-1.0/libusb.h>

#define USB_VENDOR_LOGITECH 0x046d
#define USB_PRODUCT_K290    0xc31f

std::shared_ptr<libusb_device_handle> getK290Device(std::shared_ptr<libusb_context>& context) {
	libusb_device** rawList = nullptr;
	auto numDevices = libusb_get_device_list(context.get(), &rawList);
	if (0 == numDevices) {
		return nullptr;
	}
	std::shared_ptr<libusb_device*> deviceList(rawList, std::bind(libusb_free_device_list, std::placeholders::_1, 1));
	for (int i = 0; i < numDevices; i++) {
		libusb_device_descriptor deviceDescriptor;
		auto device = deviceList.get()[i];
		libusb_get_device_descriptor(device, &deviceDescriptor); // always successful since 1.0.16
		if (USB_VENDOR_LOGITECH == deviceDescriptor.idVendor && USB_PRODUCT_K290 == deviceDescriptor.idProduct) {
			libusb_device_handle* rawHandle = nullptr;
			auto err = libusb_open(device, &rawHandle);
			if (0 == err) {
				return std::move(std::shared_ptr<libusb_device_handle>(rawHandle, libusb_close));
			} else {
				std::cerr << "Could not open device: " << libusb_error_name(err) << std::endl;
			}
		}
	}
	return nullptr;
}

int main(int argc, const char* const argv[]) {
	libusb_context* rawUsbCtx = nullptr;
	auto err = libusb_init(&rawUsbCtx);
	if (0 != err) {
		std::cerr << "Could not initialize libusb: " << libusb_error_name(err) << std::endl;
		return 1;
	}
	std::shared_ptr<libusb_context> usbContext(rawUsbCtx, libusb_exit);
	std::shared_ptr<libusb_device_handle> device(getK290Device(usbContext));
	if (nullptr == device) {
		std::cerr << "Logitech K290 not found on this system" << std::endl;
		return 2;
	}
	bool reset = ((argc > 1) && ((0 == strcmp(argv[1], "-r")) || 0 == strcmp(argv[1], "--reset")));
	err = libusb_control_transfer(device.get(), 0x40, 2, 0x001a, reset ? 0 : 1, nullptr, 0, 1000);
	if (0 == err) {
		std::cout << "Successfully set function keys to " << (reset ? "default" : "regular") << " behaviour" << std::endl;
		return 0;
	} else {
		std::cerr << "Something went wrong when sending the command: " << libusb_error_name(err) << std::endl;
		return 1;
	}
}

