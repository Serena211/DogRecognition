This is a instruction to tell you how to run this dog recognition system.
Step 1:
Download VLFEAT library via Internet. http://www.vlfeat.org/download.html
Or use the fold of VLFEAT.
Then follow the instruction to setup on MATLAB.
	% Let VLFEATROOT denote your own directory.
	>> run('VLFEATROOT/toolbox/vl_setup') 
	>> vl_version verbose
	>> vl_setup demo
	>> vl_demo_svm

Step 2:
Open the getRandImage.m file
Modify the four paths showed in this file
Run this file, and get the train.txt and test.txt files.

Step 3:
Open the testMain.m file
Change the two paths of this file to your own paths, where train.txt and test.txt are saved.
Run this file, and get the accuracy value on your Workspace.

Step 4:
If you want to change the parameters of HoG features, open getData.m file.
If you want to change the parameters of classifications, read relative documents on MathWorks.com