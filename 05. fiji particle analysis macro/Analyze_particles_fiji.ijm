function action(input, output, filename) {
	

    open(input + filename);
    run("Enhance Local Contrast (CLAHE)", "blocksize=127 histogram=256 maximum=3 mask=*None* fast_(less_accurate)");

	run("Gaussian Blur...", "sigma=2");

	setAutoThreshold("Default dark");

	setOption("BlackBackground", true);
	run("Convert to Mask");
	run("Watershed");
	
	run("Analyze Particles...", "size=0-Infinity show=Nothing display clear in_situ");
	saveAs("Results_interpol",  output + filename + ".csv"); 
   	close();
}

//input folder images
input = "/exported for particle analysis/";
//output folder csv files
output = "/particle analysis results/";

list = getFileList(input);
for (i = 0; i < list.length; i++)
        action(input, output, list[i]);

