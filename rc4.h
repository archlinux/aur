#ifndef RC4_H
#define RC4_H

char* getPassword();

void keyExchange(int keySchedule[], int len, const unsigned char* key);

char* prga(int keySchedule[], int len);

void rc4(const unsigned char output[], const unsigned char message[], FILE* out, long int len);

#endif