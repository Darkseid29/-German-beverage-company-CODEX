


-----data cleaning and joining-----

select 
  dim_city.Name,
  dim_city.City,
  dim_city.Age,
  dim_city.Gender,
  dim_city.Tier,
  fact_survey.Response_ID,
  fact_survey.Consume_frequency,
  fact_survey.Consume_time,
  fact_survey.Consume_reason,
  fact_survey.Brand_perception,
  fact_survey.General_perception,
  fact_survey.Taste_experience,
  fact_survey.Reasons_preventing_trying,
  fact_survey.Current_brands,
  fact_survey.Reasons_for_choosing_brands,
  fact_survey.Improvements_desired,
  fact_survey.Ingredients_expected,
  fact_survey.Health_concerns,
  fact_survey.Interest_in_natural_or_organic,
  fact_survey.Marketing_channels,
  fact_survey.Packaging_preference,
  fact_survey.Limited_edition_packaging,
  fact_survey.Price_range,
  fact_survey.Purchase_location,
  fact_survey.Typical_consumption_situations
         from 
             fact_survey
         inner join
             dim_city
         on 
            dim_city.Respondent_ID=fact_survey.Respondent_ID;




select
  dim_respondent.Respondent_ID,
  dim_respondent.Name,
  dim_cities.City,
  dim_respondent.Age,
  dim_respondent.Gender,
  dim_cities.Tier 
        from 
             dim_respondent 
        inner join
             dim_cities
         on 
             dim_respondent.City_ID=dim_cities.City_ID;




------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
1. Demographic Insights (examples) 
  
a. Who prefers energy drink more?  (male/female/non-binary?) 


select 
  gender,
  (count(gender)/(select count(gender) from fact_survey))*100 as gender_percentage
        from
          fact_survey
          group by gender;


gender	       gender_percentage
Female	       35.0500	
Male	         60.1000	
Non-binary	   4.8500	




b. Which age group prefers energy drinks more? 

select 
  age,
  (count(age)/(select count(age) from fact_survey))*100 as age_percentage
       from
          fact_survey 
          group by age;


age		             age_percentage
15-18	             14.4500	
19-30	             55.2000	
31-45	             23.9667	
46-65             	4.4667	
65+	                1.9167	

---------------------------------------------------------------------------------------------------------------------------------

c. Which type of marketing reaches the most Youth (15-30)? 


select
  Marketing_channels,
  (count(age)/(select count(age) from fact_survey))*100 as age_group_15_30_percentage
       from 
           fact_survey 
           where age in ('15-18','19-30')
           group by Marketing_channels;


Marketing_channels	   age_group_15_30_percentage	
TV commercials	       18.1333	
Print media	           4.4333	
Online ads	           33.6000	
Other	                 6.6000	
Outdoor billboards	   6.8833	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------


2. Consumer Preferences: 
a. What are the preferred ingredients of energy drinks among respondents? 


select 
  Ingredients_expected,
  (count(Ingredients_expected)/(select count(Ingredients_expected) from fact_survey))*100 as expected_ingredients_percentage
         from 
           fact_survey
           group by Ingredients_expected;


Ingredients_expected	   expected_ingredients_percentage
Guarana	                 15.3333	
Caffeine	               38.9500	
Vitamins	               25.1667	
Sugar	                   20.5500	

-------------------------------------------------------------------------------------------------------------------------------------

b. What packaging preferences do respondents have for energy drinks? 




select
  Packaging_preference ,
  (count(Packaging_preference)/(select count(Packaging_preference)  from fact_survey))*100 as preferred_pakaged_percentage
           from 
             fact_survey
             group by Packaging_preference;


Packaging_preference	            preferred_pakaged_percentage	
Compact and portable cans	        39.9667	
Innovative bottle design	        30.6833	
Other	                            4.3833	
Eco-friendly design	              9.4000	
Collectible packaging     	      15.5667	

------------------------------------------------------------------------------------------------------------------------------------------------------

3. Competition Analysis:

 a. Who are the current market leaders? 




select
	Current_brands ,
	(count(Current_brands)/(select count(Current_brands)  from fact_survey))*100 as preferred_brand_percentage
	       from 
	          fact_survey
	          group by current_brands;

Current_brands	    preferred_brand	
Blue Bull	    10.5833	
Bepsi	            21.2333	
Sky 9	            9.1500	
Cola-Coka	    25.5000	
Gangster	    18.7000	
CodeX	            9.9667	
Others	            4.8667	



b. What are the primary reasons consumers prefer those brands over ours?  




select 
	Heard_before,
	(count(Heard_before)/(select count(Heard_before) from fact_survey))*100 as heard_before_percentage
	      from
	        fact_survey
	        group by Heard_before;


Heard_before	heard_before_percentage	
Yes	        44.3167	
No	        55.6833	




select
	Brand_perception,
	(count( Brand_perception)/(select count( Brand_perception) from fact_survey))*100 as  Brand_perception_percentage 
	     from
	        fact_survey 
	        group by  Brand_perception;


Brand_perception	Brand_perception_percentage	
Neutral	                60.1333	
Positive	        22.0500	
Negative	        17.8167	





select Tried_before,
	(count( Tried_before)/(select count(Tried_before) from fact_survey))*100 as Tried_before_percentage
	     from 
	        fact_survey
	        group by  Tried_before;


Tried_before	Tried_before_percentage	
No	        51.3000	
Yes	        48.7000	



select Taste_experience,
	(count( Taste_experience)/(select count(Taste_experience) from fact_survey))*100 as Taste_experience_percentage 
	        from 
	          fact_survey
	          group by  Taste_experience;


Taste_experience	Taste_experience_percentage	
5	                19.6000	
2	                15.5167	
4	                24.6167	
3	                29.4167	
1	                10.8500	

1 (Poor)
		2 (Below average)
		3 (Average)
		4 (Good)
		5 (Excellent)





select Reasons_preventing_trying,(count( Reasons_preventing_trying)/(select count(Reasons_preventing_trying) from fact_survey))*100 as Reasons_preventing_trying_ from fact_survey group by  Reasons_preventing_trying;


Reasons_preventing_trying	Reasons_preventing_trying_	
Unfamiliar with the brand	18.1667	
Not interested in energy drinks	21.9667	
Not available locally	24.3333	
Other	12.9333	
Health concerns	22.6000	




select Reasons_for_choosing_brands,(count(Reasons_for_choosing_brands)/(select count(Reasons_for_choosing_brands) from fact_survey))*100 as Reasons_for_choosing_brands_ from fact_survey group by  Reasons_for_choosing_brands;


Reasons_for_choosing_brands	Reasons_for_choosing_brands_	
Availability	19.3500	
Other	16.9333	
Brand reputation	26.2667	
Effectiveness	17.6833	
Taste/flavor preference	19.7667	





select Improvements_desired,(count(Improvements_desired)/(select count(Improvements_desired) from fact_survey))*100 as Improvements_desired_ from fact_survey group by Improvements_desired;


Improvements_desired	Improvements_desired_	
Reduced sugar content	29.2833	
More natural ingredients	25.0333	
Other	10.0333	
Wider range of flavors	20.6500	
Healthier alternatives	15.0000	




select Interest_in_natural_or_organic,(count(Interest_in_natural_or_organic)/(select count(Interest_in_natural_or_organic) from fact_survey))*100 as Interest_in_natural_or_organic_ from fact_survey group by Interest_in_natural_or_organic;


Interest_in_natural_or_organic	Interest_in_natural_or_organic_	
Yes	50.1000	
Not Sure	19.6667	
No	30.2333	



select Price_range,(count(Price_range)/(select count(Price_range) from fact_survey))*100 as Price_range_ from fact_survey group by Price_range;


Price_range	Price_range_	
50-99	         42.1500	
100-150    	 31.0500	
Above 150	 15.8833	
Below 50	 10.9167	







select Purchase_location,(count(Purchase_location)/(select count(Purchase_location) from fact_survey))*100 asPurchase_location_ from fact_survey group by Purchase_location;


Purchase_location	asPurchase_location_	
Supermarkets	        44.8833	
Online retailers	26.0667	
Gyms and fitness centers	14.3500	
Other	                6.6000	
Local stores	         8.1000	


b. Which cities do we need to focus more on? 



select city,(count(city)/(select count(city) from fact_survey))*100 as city_perc from fact_survey group by city order by city_perc asc limit 5;


city	city_perc   	
Lucknow	1.6000	
Jaipur	3.4833	
Delhi	4.2500	
Ahmedabad	4.6333	
Kolkata	5.4333	



b. What are the typical consumption situations for energy drinks among respondents



select Typical_consumption_situations,(count(Typical_consumption_situations)/(select count(Typical_consumption_situations) from fact_survey))*100 as Typical_consumption_situations_perc from fact_survey group by Typical_consumption_situations;


Typical_consumption_situations	Typical_consumption_situations_perc	
Studying/working late	32.2333	
Sports/exercise	44.6500	
Social outings/parties	15.3833	
Other	4.7000	
Driving/commuting	3.0333	
















