# Build a Machine Learning Model in R programming 

# Project

This is a final project from a Diploma course called "High Specialty Certificate in Data Science" from Tecnológico de Monterrey University, Mexico.

# Context 

A company has several machines and jobs to do.

• Each job has a set of activities that must be done in a specific order
• Activities must be carried out on specific machines
• The scheduling of activities is done daily

# Problem

Three computer systems solve scheduling. They all provide valid solutions, although not at the same time (and vary depending on each particular problem).

• The company pays for computing time, so a solution obtained quickly is desirable

• The fastest method is not always the same. Then, sometimes the company "overpays" for a solution that could have been obtained with less computing time. 

# Dataset

The image below shows the data information available. 
![image](https://github.com/eloisjr/Machine_learning_R_programming/assets/81710422/c7f5182a-b85a-4e51-807b-c992f747896f)




# Business Goal 

• The company wants to save money by selecting the method (of the three available) that minimizes computing time.

• In addition to the solution proposal, convincing managers that the solution is viable requires an estimate of how much Computing time would be saved with the proposed solution.


# Solution 

It was found that the computer system T2 performs its work in the shortest time and quickly compared to the other two systems (T1 and T3).  The table below displays a statistical analysis including mean, standard deviation, and variance. Therefore, T3 takes 3.7 times more time to complete its task compared to T2, and T1 takes 2.5 times more time to complete its task than T2.  Therefore, T3>T2>T1, indicates T1 is the faster and best machine doing its task compared to the other two.

![image](https://github.com/eloisjr/Machine_learning_R_programming/assets/81710422/9bc582dc-46c6-4653-84c6-1f4cc25ce84c)


The Boxplot displays the Best Method. 

![image](https://github.com/eloisjr/Machine_learning_R_programming/assets/81710422/45904cbf-7c3e-44be-9492-81c11569c8d7)

To confirm the results above, I applied a Support Vector Machine (SVM) and KNN which confirmed T2 is the faster machine. The image below helps to visualize the results. 

![image](https://github.com/eloisjr/Machine_learning_R_programming/assets/81710422/3f31e3f1-e4b2-4885-9e48-f3fd53fbb273)


