## Description
Just a Project template for writing spark applications

## Code Details

### Build
```bash
mvn clean install
```

### Deploy
Copy the created jar file and the bash script to the cluster.

### Configure
- Update SPARK_HOME in the submit script.
- Update the number of executors and memory usage in `submit_job.sh` depending on the number of files to be processed. Or leave as is for dynamic allocation.

### Execute
```bash
./submit_job.sh \
- e test \
- y 2017 \
- m 01 \
- d 01 \
- H 01 
```