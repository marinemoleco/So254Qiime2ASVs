# So254Qiime2ASVs
## qiime2 commands for the Sonne254 amplicon dataset

Folders contain files necessary or derived from the commands and scripts mentioned in the log files in the main folder.
log file and folder numbers imply their order in this "pipeline"

### Update 18.02.2019
- added *--p-confidence 0.8* to *classify-sklearn*
- added Kathrin's "no junk" filter (i.e. Mitochondria, Chloroplast, unassigned)
- updated initial filtering

### Update 07.02.2019
- removed several outdated and temporary log files
- removed quality trimming and updated 1_QualityControl_log.txt
- update 2.0_qiime2_dada2_log.txt - new parameters and settings from the beginning - will continue

### Update 27.09.2018
- minor metadata.v2 update
- several "Class" analysis updates within "2.1_qiime2_dada2_class_log.txt"
- added 2.2 and 2.3 for preliminary Hexactinellida and Demospongiae specific analyses

### Update 26.09.2018
- added curated metadata.v2
- changed DADA2 specific files names to general file names -> make the qiime2 commands interchangeable between clustering and ASV methods
- deblur is now 3. and dada2 is still 2.
- added sample filter by "Class" in metadata.v2 workflow "2.1_qiime2_dada2_class_log.txt" -> Demo, Hexac, Sed, Sw
- first alpha and beta div analyses for "Class" filtered data
- minor changes in "2_qiime2_dada2_log.txt"

### Update 13.09.2018
- updated dada2 log
- added deblur log
- new metadata and manifest files for deblur
