/* 1. SAS Programme to create permanant library "school" & dataset "student" Also creating 
      variable named "per" to store percentage of the student */


data school.student;
input rno name$ m1 m2 gender$;
per = (m1+m2)/2;
datalines;
1 harry 98 99 male
2 mac 99 98 male
3 pooja 99 97 female
4 geeta 99 99 female
5 rox 78 65 male
6 ramesh 65 55 male
7 nita 45 63 female
;
run;

proc print data=school.student;
run;


/* 2. SAS prog. to sort the result in descending order of percentage */

proc sort data = school.student;
by per;
run;

proc print data = school.student;
run;


/* 3. To sort the data in ascending order of gender and then descending order of percentage */ 

proc sort data = school.student;
by gender DESCENDING per;
run;

proc print data = school.student;
run;


/* 4. Prog. to assign the grades to student on the basis of percentage */


data work.stud;
set school.student;
	if per => 75 then Grade = "Distinction";
	else if per => 60 and per < 75 then Grade = "First Class";
	else if per => 50 and per < 60 then Grade = "Second Class";
	else if per => 40 and per < 50 then Grade = "Passed Class";
	else grade = "Failed";
run;

proc print data=work.stud;
run;


/* 5.  to create new dataset  student1 which contains only "name","gender" & "per" variables from 
       student dataset */ 

Data school.student1;
set school.student;
keep name gender per; 
run;

proc print data=school.student1;
run;

