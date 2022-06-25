/**
 * This is based on the code in
 * https://github.com/pixelomer/Celeste-ARM64/issues/2 - credit goes to
 * @JohnnyonFlame for figuring this out!
 */

#include <fmod.h>

FMOD_RESULT F_API _FMOD_System_Create(void *studiosystem)
{
        return FMOD_System_Create(studiosystem, FMOD_VERSION);
}
