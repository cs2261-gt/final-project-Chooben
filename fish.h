
//{{BLOCK(fish)

//======================================================================
//
//	fish, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 4 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 128 + 2048 = 2688
//
//	Time-stamp: 2020-04-25, 17:30:06
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FISH_H
#define GRIT_FISH_H

#define fishTilesLen 128
extern const unsigned short fishTiles[64];

#define fishMapLen 2048
extern const unsigned short fishMap[1024];

#define fishPalLen 512
extern const unsigned short fishPal[256];

#endif // GRIT_FISH_H

//}}BLOCK(fish)
