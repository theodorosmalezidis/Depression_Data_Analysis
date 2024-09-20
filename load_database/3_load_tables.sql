COPY depression_data
FROM 'C:\Users\User\Desktop\portofolio projects\Depression_Data_Analysis\csv_file\depression_data.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ':', ENCODING 'UTF8');



/*
\copy depression_data FROM 'C:\Users\User\Desktop\portofolio projects\Depression_Data_Analysis\csv_file\depression_data.csv' WITH (FORMAT csv, HEADER true, DELIMITER ';', ENCODING 'UTF8');