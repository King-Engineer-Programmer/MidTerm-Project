# group_2_midterm

## Data:

Our dataset consists of 1.4 million phone reviews

source: 

https://www.kaggle.com/datasets/masaladata/14-million-cell-phone-reviews?resource=download&select=phone_user_review_file_1.csv

zipped files:

https://drive.google.com/file/d/1B9PhmJdNjG1mM4GNiIIaWp8oJvrGmCPh/view?usp=sharing

## Purpose:

To try and understand the experience between the user and a cell phone and understand which manufacturer and its products have an overall good rating and rank them accordingly

# Phase 1

## Cleaning Process:
<b>Notes: 
	
- Extract the zip file that will be downloaded to group_2_midterm\Phase_1\resources
	
- Expected cwd for jupyter notebook is group_2_midterm\Phase_1 to run phase 1
</b>

First we run <b>extraction_transformation_pipeline.ipynb</b> in order to create the csv files that will be used for the database

Below is the ERD that is used for our phone reviews database:


![Phone Review ERD](db_resources/phone_reviews_ERD.png)

After the cleaning process the files to be uplaoded to the database will be stored in the path group_2_midterm\Phase_1\resources\db_files

## Testing Process:
After cleaning we tested the cleaned dataset on 4 tests:
1. Cleaned dataset should have 9 columns
2. The author column should not contain any NaN or NULL values
3. The score column should not contain any NaN or NULL values
4. The cleaned dataset should have less rows than the original dataset

# Phase 2

## Migrating to the cloud:
We decided to host our files on google drive:

(files cleaned and loaded into the database)

https://drive.google.com/drive/folders/1pgzfpjkkRTUdvo6KzhWYTxO-SGVFuIqD?usp=sharing

(file may be very large since they are merged together)
https://drive.google.com/file/d/1t6fwPgO5ml89zf4k5btrwRj9r83WzlcS/view

## Pyspark Parquets
After loading in the dataframe, we decided to run different queries in pyspark in order to compare time differences


Tested query:
	
```
sql = ("""
	select country,source,product, COUNT(source) as People
	from phone
	group by country,source,product
	order by people desc
""")
```


	- without using a parquet: --- 3.0390801429748535 seconds ---

 	- using a parquet: --- 1.636444091796875 seconds ---

## Testing Process
We used great expecations to check if there exists any null value in our dataset


We then used pytest and created 4 tests:
1. check if 9 total columns
2. check if all the column names that we expect matches
3. check if the number of new columns does not match our old columns (11 columns -> 9 columns)
4. check if all the values in the score column is greater than 0


