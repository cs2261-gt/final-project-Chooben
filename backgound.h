
//{{BLOCK(backgound)

//======================================================================
//
//	backgound, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 64 + 2048 = 2624
//
//	Time-stamp: 2020-04-07, 20:34:43
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKGOUND_H
#define GRIT_BACKGOUND_H

#define backgoundTilesLen 64
extern const unsigned short backgoundTiles[32];

#define backgoundMapLen 2048
extern const unsigned short backgoundMap[1024];

#define backgoundPalLen 512
extern const unsigned short backgoundPal[256];

#endif // GRIT_BACKGOUND_H

//}}BLOCK(backgound)
