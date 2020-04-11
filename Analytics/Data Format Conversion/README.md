# This sample  is to demonstrate data format conversion using ADF

## Background
Normally Analytics proejct need to convert data format, such as: CSV files convert to Parquet since Parquet Apache Parquet is designed for columnar storage, which is more efficiency to compare with CSV files during to query data.  

## Requirement

Create Azure Data Lake Storage Gen 2

Create Azure Data Factory

Upload sample CSV file to Azure Data Lake Storage Gen 2

## Sample for CSV convert to Parquet

Let’s use this article as a simple to introduce how to use Azure Data Factory convert CSV file to Parquet. 

Step1: Create linked service for CSV and Parquet files from Azure Data Lake Gen2. 

In this sample, linked service is shared since the both CSV and Parquet files will store one Azure Data Lake Gen 2 account.  

Create Azure Synapse database

Upload sample Parquet file to Azure Data Lake Storage Gen 2




