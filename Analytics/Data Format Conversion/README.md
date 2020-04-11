# This sample  is to demonstrate data format conversion using ADF

## Background
Normally Analytics proejct need to convert data format, such as: CSV files convert to Parquet since Parquet Apache Parquet is designed for columnar storage, which is more efficiency to compare with CSV files during to query data.  

## Requirement

Create Azure Data Lake Storage Gen 2

Create Azure Data Factory

Upload sample CSV file to Azure Data Lake Storage Gen 2

## Sample for CSV convert to Parquet

Let’s use this article as a simple to introduce how to use Azure Data Factory convert CSV file to Parquet. 

Step 1: Create linked service in ADF, this linked service will use Azure Data Lake Gen2 as storage layer to store source CSV file and generated Parquet file.

<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Analytics/Data%20Format%20Conversion/IMAGES/LinkedService.png" />&nbsp;


Step 2: Create two data source in ADF, one use CSV format, another one use Parquet format. 
In this sample, create two datasource named "ADLSGen2CSVIrisDS" and "ADLSGen2ParquetIrisDS". 

<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Analytics/Data%20Format%20Conversion/IMAGES/IrisCSVDS.png" />&nbsp;

<IMG SRC="https://github.com/amberz/Azure-Data-Services-Practices/blob/master/Analytics/Data%20Format%20Conversion/IMAGES/IrisParquetDS.png" />&nbsp;

Step 3: Create a pipeline in ADF, draw a copy activity to the pipeline, choose source to CSV datasource, and 

In this sample, linked service is shared since the both CSV and Parquet files will store one Azure Data Lake Gen 2 account.  

Create Azure Synapse database

Upload sample Parquet file to Azure Data Lake Storage Gen 2




