#York System extractor

Some tools to help extract data from the _York System_ MS Access-based zooarchaeological recording system (Harland _et al._ 2003). This was designed for Access 2000 and suffers from various compatability issues with more recent versions of the software that complicate data extraction. The code here provides an automated solution for extraction and simple manipulation of data from within a York System .mdb file.

##Current functions

####**read.YS: import York System data**
Reads in all tables from a specified .mdb file as created using the York System and stores them as a list of data.tables.

####**decode.YS: decode data using lookup tables**
Goes through each of the main data tables and replaces codes values with their long-form from the lookup tables, as appropriate. Optionally deletes the lookup tables after doing this.

####**export.YS: export tables as .csv files**
Exports all tables to a defined directory in .csv format, with the option of excluding lookup and/or measurement tables.

##Future functions

####**measures.YS: collate measurement data**
Combines and melts all measurement data into a single narrow format table.

####**merge.YS: combine main data tables**
Merges specified data tables (default: all) into a single data.table - useful for those who want to conduct further analysis in R rather than just archiving the output.

##References
J.F. Harland _et al._ 2003. The York System: an integrated zooarchaeological database for research and teaching', _Internet Archaeology_ 13. [http://dx.doi.org/10.11141/ia.13.5]