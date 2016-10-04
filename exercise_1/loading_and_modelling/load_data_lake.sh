# Entry assumption: download the files to your computer respository of your choice and navigate to this folder within bash

# for my case, I set my working directory below - commented out
cd "C:\Users\Dan\Google Drive\DataSci\205_data_storage\205_git\w205_wald\exercise_1"

# commands for stripping out header and renaming
tail -n +2 '.\Hospital General Information.csv' > .\hospitals.csv
tail -n +2 '.\Timely and Effective Care - Hospital.csv' > .\effective_care.csv
tail -n +2 '.\Readmissions and Deaths - Hospital.csv' > .\readmissions.csv
tail -n +2 '.\Measure Dates.csv' > .\measures.csv
tail -n +2 .\hvbp_hcahps_05_28_2015.csv > .\survey_responses.csv
