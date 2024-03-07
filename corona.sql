
-- ANALYSIS ON COVID19 DATASET --

use tinku1;

select * from corona;

-- 1. Find the number of corona patients who faced shortness of breath. --

select * from corona_tested_006 where Shortness_of_breath='TRUE';

-- 2. Find the number of negative corona patients who have fever and sore_throat. --

select * from corona_tested_006 where corona='negative' and  fever='True' and sore_throat='True';

-- 3. Group the data by month and rank the number of positive cases. --

select month(Test_Date) AS TestMonth,count(*) AS PositiveCases,
rank() over(order by count(*) desc) as CaseRank
from corona where Corona = 'positive'group by TestMonth order by TestMonth;

-- 4. Find the female negative corona patients who faced cough and headache. --

select * from corona;

select * from corona where corona='negative' and sex='female' and cough_symptoms='TRUE' and headache='true';

-- 5. How many elderly corona patients have faced breathing problems? --

select count(*),age_60_above,shortness_of_breath from corona group by 
age_60_above,shortness_of_breath having shortness_of_breath='true';

-- 6. Which three symptoms were more common among COVID positive patients? --

SELECT Cough_symptoms,Fever,Sore_throat,Shortness_Of_Breath,Headache,COUNT(*) AS Count_of_Patients FROM corona
WHERE Corona= 'positive'GROUP BY Cough_symptoms, Fever, Sore_throat, Shortness_Of_Breath, Headache
ORDER BY Count_of_Patients DESC LIMIT 3;

select * from corona;

-- 7. Which symptom was less common among COVID negative people? --

SELECT Cough_symptoms,Fever,Sore_throat,Shortness_Of_Breath,Headache,COUNT(*) AS Count_of_Patients FROM corona
WHERE Corona= 'negative'GROUP BY Cough_symptoms, Fever, Sore_throat, Shortness_Of_Breath, Headache
ORDER BY Count_of_Patients asc LIMIT 3;

-- 8. What are the most common symptoms among COVID positive males whose known contact was abroad? --

SELECT Cough_symptoms,Fever,Sore_throat,Shortness_Of_Breath,Headache,COUNT(*) AS Count_of_Patients
FROM corona WHERE Corona = 'positive'AND Sex = 'male'AND Known_Contact = true
GROUP BY Cough_symptoms, Fever, Sore_throat, Shortness_Of_Breath, Headache
ORDER BY Count_of_Patients DESC LIMIT 3;









