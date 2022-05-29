# MiSTerFPGA Y/C (NTSC/PAL) Encoder

## Y/C Reference Documentation
For more information, please use the MiSTerFPGA CRT Wiki for more information: [CRT Wiki (YC Cores)](https://mister-devel.github.io/MkDocs_MiSTer/advanced/crt/#unofficial-custom-yc-s-video-composite-cores-by-mikes11 "CRT Wiki (YC Cores)")

A bit on how the module works and history can be found [Here](https://docs.google.com/document/d/1FrfUKQedBdkgifHC88ouqLF9IDCNamC8TyLIcY3rou0/edit?usp=sharing"Here")

**Arcade Cores** - Its recommended you created a new folder _YCArcade and _YCArcade/cores in order to not mix up the update script with the YC cores. Copy the mra files into the root of the directory and the YC cores into the cores directory.

Note: For new cores, the Template always defaults with Y/C to be disabled and is up to a developer to enable it in the QSF File.

##  Test Builds: [Y/C Test Builds](https://github.com/MikeS11/MiSTerFPGA_YC_Encoder/tree/main/YC%20Builds "Y/C Test Builds")


## Core Tuning
Cores are initially setup with a phase accumulator value that references the standard NTSC / PAL clock frequency and is recommended that it be tuned to eliminate all dot crawl or to better reflect the real console.




The calculation is simply: 

(NTSC/PAL Ref Freqency * 2 ^ 40) / Core CLK_VIDEO 

	**Example Genesis**
	NTSC = 3.579545    
	W = 40 ( 32 bit fraction, 8 bit look up reference)    
	Genesis Core Video Clock = 107.38635    
	
	Phase_Inc = 3.579545 * 2 ^ 40 / 107.38635 = 36650387593    
------------
The following link: [Tuned Core Variables](https://docs.google.com/spreadsheets/d/12_6MyuY7f6CZYXztdT0C30SWL0nk2_MNe_Cno_D-txA/edit?usp=sharing "Tuned Core Variables") holds the current"tuned"phase accumulator value for existing cores

### Tuning
The TestPatterns_YC Core includes 3 additional variables used during the tuning process, the first variable increase the phase accumulator by 1-31, the second mutiplies that value by 2^1-31 and the last variable subtracts that if you wish to decrease the value. 

The following must be added to the menu:

`"O8C,Chroma Add timing,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31;",`   
`"OEI,Chroma Multiply,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31;",`   
`"OD,Reverse,No,Yes;",`   









