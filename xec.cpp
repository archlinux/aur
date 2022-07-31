#include <iostream>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/file.h>
#include <cctype>
#include <sstream>
#include <string>

using namespace std;

int ec_fd;

int err(char *txt) {
	throw std::invalid_argument(txt);
}

int ec_init() {
	if ((ec_fd = open("/dev/port", O_RDWR)) < 0) {
		err("Cannot open /dev/port");
	}
	return 0;
}

int ec_close() {
	close(ec_fd);
	ec_fd = -1;
	return 0;
}

enum Status : int {
	output_buffer_full = 0x01,
	input_buffer_full = 0x02,
	command = 0x08,
	burst_mode = 0x10,
	sci_event_pending = 0x20,
	smi_event_pending = 0x40
};

enum Ports : int {
	command_port = 0x66, data_port = 0x62
};

enum Command : int {
	_read = 0x80,
	_write = 0x81,
	burst_enable = 0x82,
	burst_disable = 0x83,
	query = 0x84
};

byte ec_read(uint8_t port) {

	byte ch = (byte) 0;

	if (lseek(ec_fd, port, 0) < 0) {
		err("cannot lseek");
	}

	if (read(ec_fd, &ch, 1) != 1) {
		err("cannot read");
	}

	return ch;
}

byte ec_write(uint8_t port, byte data) {
	if (lseek(ec_fd, port, 0) < 0) {
		err("cannot lseek");
	}
	if (write(ec_fd, &data, 1) != 1) {
		err("cannot write");
	}
	//return ec_read(port);
	return data;
}

bool ec_wait_status(int port, Status status) {
	int timeline = 200;
	while (timeline > 0) {
		timeline--;
		byte f = (byte) ec_read(0x66);
		if (((int) status && (int) f) == 0)
			return int(1000 - timeline);
	}
	return false;
}

#ifndef _COLORS_
#define _COLORS_

/* FOREGROUND */
#define RST  "\x1B[0m"
#define KRED  "\x1B[31m"
#define KGRN  "\x1B[32m"
#define KYEL  "\x1B[33m"
#define KBLU  "\x1B[34m"
#define KMAG  "\x1B[35m"
#define KCYN  "\x1B[36m"
#define KWHT  "\x1B[37m"
#define KGRY  "\033[1;30m"
#define KLRD  "\033[1;31m"
#define KLGN  "\033[1;32m"
#define KRVR  "\033[1;7m"

#define FRED(x) KRED x RST
#define FGRN(x) KGRN x RST
#define FYEL(x) KYEL x RST
#define FBLU(x) KBLU x RST
#define FMAG(x) KMAG x RST
#define FCYN(x) KCYN x RST
#define FWHT(x) KWHT x RST

#define BOLD(x) "\x1B[1m" x RST
#define UNDL(x) "\x1B[4m" x RST

#endif  /* _COLORS_ */

int monitor() {

	cout << "  │ ";
	for (uint16_t x = 0; x < 16; x++) {
		string append = ((int) x < 16 ? "0" : "");
		cout << KRVR << append << uppercase << std::hex << x << " ";
	}
	cout << RST;
	cout << endl << "──┼";
	for (uint16_t x = 0; x < 16 * 3; x++) {
		cout << "─";
	}
	cout << endl;

	for (int i = 0; i < 256; i++) {
		ec_wait_status(Ports::command_port, Status::input_buffer_full);
		ec_write(Ports::command_port, (byte) Command::_read);
		ec_wait_status(Ports::command_port, Status::input_buffer_full);
		ec_write(Ports::data_port, (byte) (i));
		ec_wait_status(Ports::command_port, Status::output_buffer_full);
		byte data = ec_read(Ports::data_port);

		if (i == 0)
			cout << KRVR << "00" << RST << "│ ";

		if ((i % 16) == 0 && i != 0) {
			cout << endl;
			cout << RST << KRVR << uppercase << i << RST << "│ ";
		}


		string append = ((int) data < 16 ? "0" : "");

		cout << uppercase << ((int) data == 0xFF ? KLGN : (int) data == 0x00 ? KGRY : KLRD);
		cout << append << uppercase << std::hex << (int) data << " ";
		//cout << std::hex << append << (int) data << " ";
	}
	cout << endl;
}

int help() {
	cout << "eXecute EC" << endl;
	cout << "<commands>" << endl;
	cout << "  xec read 0xXX : read value from EC memory" << endl;
	cout << "  xec write 0xXX 0xXX : write value to EC memory" << endl;
	cout << "  xec monitor : full table of EC memory" << endl;
	cout << endl;

	cout << "<example>" << endl;
	cout << "  watch -n 1 -c -d sudo xec monitor : print EC table with changes highlight every second" << endl;
}

int main(int argc, char **argv) {

	ec_init();

	if (argv[1] != NULL) {
		if (strcmp(argv[1], "read") == 0) {

			if (argv[2] == NULL)
				err("no address");

			unsigned int hex = stoul(argv[2], nullptr, 16);

			ec_wait_status(Ports::command_port, Status::input_buffer_full);
			ec_write(Ports::command_port, (byte) Command::_read);
			ec_wait_status(Ports::command_port, Status::input_buffer_full);
			ec_write(Ports::data_port, (byte) hex);
			//ec_wait_status(Ports::command_port, Status::input_buffer_full);
			ec_wait_status(Ports::command_port, Status::output_buffer_full);
			cout << argv[2] << ": " << uppercase << std::hex << "0x"
					<< (int)ec_read(Ports::data_port) << endl;

		} else if (strcmp(argv[1], "write") == 0) {

			if (argv[2] == NULL)
				err("no 1 address");
			if (argv[3] == NULL)
				err("no 2 address");


			unsigned int hex0 = stoul(argv[2], nullptr, 16);
			unsigned int hex1 = stoul(argv[3], nullptr, 16);

			ec_wait_status(Ports::command_port, Status::input_buffer_full);
			ec_write(Ports::command_port, (byte) Command::_write);
			ec_wait_status(Ports::command_port, Status::input_buffer_full);
			ec_write(Ports::data_port, (byte) hex0);
			ec_wait_status(Ports::command_port, Status::input_buffer_full);
			ec_write(Ports::data_port, (byte) hex1);
			ec_read(Ports::data_port);

			cout << uppercase << std::hex << argv[2] << ": " << argv[3] << endl;
		} else if (strcmp(argv[1], "monitor") == 0) {
			monitor();
		} else if (strcmp(argv[1], "help") == 0 || strcmp(argv[1], "") == 0) {
			help();
		} else {
			cout << "unknown command" << endl;
			return 0;
		}
	} else {
		help();
		//cout << "type help" << endl;
	}

	ec_close();
}
