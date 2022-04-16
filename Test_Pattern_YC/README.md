## MiSTerFPGA - NTSC Encoder - S-Video / Composite Output 
This is an attempt to add chroma out to the MiSTerFPGA using the (Red) output for the Chroma output and (Green) for the Luma

### Quick Note:

- SOG Must be on
- YPbPr=1 in the Mister INI file
- A cable interface to get S-Video from the Green (Luma) / Red (Chroma) - I use a component cable to Svideo (C64 Adapter), Or have a 1702 Monitor :)

**YPbPr=1 is requred in the MiSTer ini file, as well as using green for LUMA (Y) and red for CHROMA (C). A VGA to component is what I am currently using. Just another note, YPbPr/Component will not work as I am using that option to test YC**

The YUV standard was used with the following assumptions

  Y	0.299R' + 0.587G' + 0.114B'

  U	0.492(B' - Y) 

  V	0.877(R' - Y)  

  C = U * Sin(wt) + V * Cos(wt) 

### Reference Lookup Tables

A phase accumulator increment is added to the emu block. It should change based on the reference clock (clk_vid) have options for both for PAL/NTSC.
Phase Accumulator Increments (Fractional Size 12, look up size 7 bit, total 19 bits)
- Increment Calculation - (Output Clock * 2 ^ Word Size) / Reference Clock

- Example NTSC		= 3.579545
			W			    = 19 ( 12 bit fraction, 7 bit look up reference)
			Ref CLK		= 85.90908  (This could us any clock)
			NTSC_Inc	= 3.579545 * 2 ^ 32 / 85.90908 = 178956971 

### Other notes:

This is only a concept right now and there is still a lot of work to see how well this can be applied to more applications or even how the existing issues can be cleaned up.

AC coupling 470pF - 1nF capacitor was used on the Chroma output, but may not be required.

Most of the source was written in vga_out.sv but additions were added to the emu block and sys_top. 

Some additional options to push the reference clocks were added to the menu for debugging.
