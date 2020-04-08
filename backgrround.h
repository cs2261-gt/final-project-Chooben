
//{{BLOCK(backgrround)

//======================================================================
//
//	backgrround, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 3 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 96 + 2048 = 2656
//
//	Time-stamp: 2020-04-08, 18:41:52
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKGRROUND_H
#define GRIT_BACKGRROUND_H

#define backgrroundTilesLen 96
extern const unsigned short backgrroundTiles[48];

#define backgrroundMapLen 2048
extern const unsigned short backgrroundMap[1024];

#define backgrroundPalLen 512
extern const unsigned short backgrroundPal[256];

#endif // GRIT_BACKGRROUND_H

//}}BLOCK(backgrround)
