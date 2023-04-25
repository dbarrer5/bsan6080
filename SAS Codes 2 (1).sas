PROC IMPORT DATAFILE="c:\DB 8.28.2021\test.xlsx"
     DBMS=xlsx
     OUT=WORK.test REPLACE;
RUN;

/* Find contents of the file */
proc contents data = test;
run;


/* Print the 1st 75 cases */
Proc print data = test (obs = 75); 
run; 


/* Creat a sub-dataset where spare parts is equal to 5 or 6, call the new data set sparedata */
data sparedata;  
  set test; 
  if spare_parts= 5 or spare_parts=6;
run;

/* Creat a sub-dataset where Prob solver is greater than 4, call the new data set probdata */
data probdata;  
  set test; 
  if prob_solver>4;
run;


/* Merge sparedata and probdata. Name the new dataset weirddataset */
data weirddataset; 
  set probdata sparedata; 
run;

/* Sort weirddataset by price*/
 



/* Print result of sorting from the previous step */


/* In the weirddataset, take the log of price. Then devide it by quality. Name the new variable "meaningless var"! */



/* Find the average for "meaningless var" */


/* What is the correlation between meaningless var and ease of install. Explain */



/* Run a linear regression; use choice as the dep var and all other vars except for meaningless as the indep ones. Explain */



/* Run a logistic regression; use choice as the dep var and all other vars except for meaningless as the indep ones. Explain */








