/**
 * This is a copy-paste of the code posted in
 * https://github.com/pixelomer/Celeste-ARM64/issues/2 - credit goes to
 * @JohnnyonFlame for figuring this out!
 */

// TODO:: should probably be taken from fmod.h...
#define FMOD_VERSION 0x00020206
#define DECLSPEC __attribute__ ((visibility("default")))
DECLSPEC int _FMOD_Studio_EventInstance_SetParameterValue(void *system, const char *name, float value)
{
        extern int FMOD_Studio_EventInstance_SetParameterByName(void *, const char *, float, int);
        return FMOD_Studio_EventInstance_SetParameterByName(system, name, value, 0);
}

DECLSPEC int _FMOD_Studio_System_Create(void *studiosystem, unsigned int headerversion)
{
        // Override the FMOD_VERSION header.
        extern int FMOD_Studio_System_Create(void *, int);
        return FMOD_Studio_System_Create(studiosystem, FMOD_VERSION);
}
