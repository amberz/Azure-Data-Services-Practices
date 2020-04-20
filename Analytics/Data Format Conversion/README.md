# This sample  is to demonstrate data format conversion using ADF

## Background
Normally Analytics proejct need to convert data format, such as: CSV files convert to Parquet since Parquet Apache Parquet is designed for columnar storage, which is more efficiency to compare with CSV files during to query data.  

### More about Delimited text format
From [Wikipedia](https://en.wikipedia.org/wiki/Delimiter-separated_values), formats that use delimiter-separated values (also DSV):store two-dimensional arrays of data by separating the values in each row with specific delimiter characters. 

Any character may be used to separate the values, but the most common delimiters are the comma, tab, and colon. So in a comma-separated values (CSV) file the data items are separated using commas as a delimiter, while in a tab-separated values (TSV) file, the data items are separated using tabs as a delimiter. 


## Requirement

Create Azure Data Lake Storage Gen 2

Create Azure Data Factory

Upload sample CSV file to Azure Data Lake Storage Gen 2

## Sample for CSV convert to Parquet

Azure Data Factory support 6 data formats (Avro format, Binary format, Delimited text format, JSON format, ORC format, Parquet format). For flat files, it's easy to use ADF to convert them. 

Let’s use this article as a simple to introduce how to use Azure Data Factory convert CSV file to Parquet. 

Step 1: Create linked service in ADF, this linked service will use Azure Data Lake Gen2 as storage layer to store source CSV file and generated Parquet file.

<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Analytics/Data%20Format%20Conversion/IMAGES/LinkedService.png" />&nbsp;


Step 2: Create two data source in ADF, one use CSV format, another one use Parquet format. 
In this sample, create two datasource named "ADLSGen2CSVIrisDS" and "ADLSGen2ParquetIrisDS". 

<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Analytics/Data%20Format%20Conversion/IMAGES/IrisCSVDS.png" />&nbsp;

<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Analytics/Data%20Format%20Conversion/IMAGES/IrisParquetDS.png" />&nbsp;

Step 3: Create a pipeline in ADF, draw a copy activity to the pipeline, choose "ADLSGen2CSVIrisDS" as CSV datasource, then choose "ADLSGen2ParquetIrisDS" as sink, enter desired Parquet file name. 

<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Analytics/Data%20Format%20Conversion/IMAGES/Pipeline.png" />&nbsp;

Step 4: Run the data format conversion pipeline, and see the parquet output.

<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Analytics/Data%20Format%20Conversion/IMAGES/GeneratedParquetFile.png" />&nbsp;

5 dollers bonus, no need other tools to read parquet, just open ADF "ADLSGen2ParquetIrisDS" datasource, you would preview the generated parquet file. Enjoy! 

<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Analytics/Data%20Format%20Conversion/IMAGES/PreviewParquet.png" />&nbsp;




