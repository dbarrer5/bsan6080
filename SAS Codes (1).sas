PROC IMPORT DATAFILE="c:\DB 8.28.2021\test.xlsx"
     DBMS=xlsx
     OUT=WORK.test REPLACE;
RUN;

/* Find contents of the file */
proc contents data = test;
run;

/* Print the 1st 20 cases */
Proc print data = test (obs = 20); 
run; 

/* Print the 1st 50 cases */

/* create a subset of the original data */ 
data forprice;  /*Will create a temporary file called forprice */
  set test; /*Defines file to be read */
  if price = 6 ;  /*Condtion to be included in the file */
run;
/* Do the same for maintenance equal to 5 or 6, call the new data set formain */

data formain;  /*Will create a temporary file called formain */
  set test; /*Defines file to be read */
  if maintenance = 5 or maintenance = 6 ;  /*Condtion to be included in the file */
run;
/*Combine the 2 files */
data pfile; 
  set forprice formain; 
run;


/* Creat two datasets: first quality eqaul to 6 or 7 (name it d1), and the second ease of install smaller than 5 (name it d2). 
Next merge the two datasets  (name it d12)*/




  Proc sort data = pfile; 
  by quality; 
run;
Proc print data = pfile; 
  var quality; 
  run;

/* Sort the data based on price and print out the results */


Proc print data = pfile (obs = 20); 
run;
/*Basic math */
data pfilet1;
  set pfile; 
  if quality < 5 then lowqual = 1; else lowqual = 0; /*creates a dummy variable blue)*/
  lqual = log(quality);  /* log transforms */
  qualperdollar = quality/price; /*division*/
  qualnew = quality + 2; /* addition, elevating quality */
  pricenew = price*5 ; /* Multiplication */
  warranty = warranty - 2; /* Subtraction */ 
run;

/* multiply quality to prob_solver, add 5 to the outcome. Then devide it by price. Name the final var "starnge number"! */


/*average */
proc means data = test; 
  var quality price warranty; 
run;

/* Find the average for the ease of install variable */


/*correlation */
Proc corr data = test; 
  var price quality warranty; 
run;

/* What is the correlation between ease of install and price, explain */


/* Regression */ 
Proc reg data = test; 
  model choice = price energy_loss maintenance warranty spare_parts ease_of_install prob_solver quality ; 
run;

/* run a regression with price being the dep var and quality, maintenance, and warranty being the indep ones. Explain */


/* Logistic Regression */ 
proc logistic data = test ;
  model Choice = price energy_loss maintenance warranty spare_parts ease_of_install  ;
  run;

  /* Use choice as the dep var, and add prob_solver and quality to your indep var list. How does that mpact the result?*/ 
