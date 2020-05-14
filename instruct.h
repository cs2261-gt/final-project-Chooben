
//{{BLOCK(instruct)

//======================================================================
//
//	instruct, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 204 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 6528 + 2048 = 9088
//
//	Time-stamp: 2020-04-20, 22:14:06
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCT_H
#define GRIT_INSTRUCT_H

#define instructTilesLen 6528
extern const unsigned short instructTiles[3264];

#define instructMapLen 2048
extern const unsigned short instructMap[1024];

#define instructPalLen 512
extern const unsigned short instructPal[256];

#endif // GRIT_INSTRUCT_H

//}}BLOCK(instruct)
