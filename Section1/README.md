1. setup.sh to setup python env and cron schedule
2. cron schedule is currently set to run at 1:30 AM. Providing 30mins buffer time for file to come in at 1am would reduce false alarm of pipeline failure.
3. Python library papermill will trigger the ETL code in Data_Pipelines.ipynb. CSV output will be saved to /output/csv_files/.
