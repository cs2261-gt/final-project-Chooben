
//{{BLOCK(region1)

//======================================================================
//
//	region1, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 6 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 192 + 2048 = 2752
//
//	Time-stamp: 2020-04-20, 21:30:46
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_REGION1_H
#define GRIT_REGION1_H

#define region1TilesLen 192
extern const unsigned short region1Tiles[96];

#define region1MapLen 2048
extern const unsigned short region1Map[1024];

#define region1PalLen 512
extern const unsigned short region1Pal[256];

#endif // GRIT_REGION1_H

//}}BLOCK(region1)
