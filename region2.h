
//{{BLOCK(region2)

//======================================================================
//
//	region2, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 64 + 2048 = 2624
//
//	Time-stamp: 2020-04-25, 16:39:10
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_REGION2_H
#define GRIT_REGION2_H

#define region2TilesLen 64
extern const unsigned short region2Tiles[32];

#define region2MapLen 2048
extern const unsigned short region2Map[1024];

#define region2PalLen 512
extern const unsigned short region2Pal[256];

#endif // GRIT_REGION2_H

//}}BLOCK(region2)
