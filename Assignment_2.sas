/* 2. Use the procedure to check the total number of variables, observation 
      and datatype of the variables in the dataset created. */
     
proc contents Data = wrister.earthquake;
run;


/* 3.  Sort the dataset in the ascending order of the variable 'mag'. */

proc sort data = wrister.earthquake;
by mag;
run;


/*  4. Create a new dataset with any suitable name which contains observation where depth 
        is greater than equal to 50 and less than equal to 150. */

data work.earthquakedepth;
set wrister.earthquake;
where depth >= 50 and depth <= 150;
run;

proc print data = work.earthquakedepth;
run;

/* 5. Create the following report. */

proc report data = wrister.earthquake out = work.magreport;
column type magtype;
define type/group;
define magtype/across;
run;

proc print data = work.magreport;
run;












