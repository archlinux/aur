#include <efi.h>
#include <efilib.h>

EFI_STATUS
EFIAPI
efi_main (EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable) {
    InitializeLib(ImageHandle, SystemTable);
    return uefi_call_wrapper(SystemTable->RuntimeServices->ResetSystem, 4, 
                             EfiResetShutdown, EFI_SUCCESS, sizeof(NULL), NULL);
}
