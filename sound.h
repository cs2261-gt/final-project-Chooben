SOUND soundA;
SOUND soundB;

#define SOUND_FREQ 11025

void setupSounds();
void playBossTheme(const signed char* sound, int length, int loops);
void playGunSound(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
