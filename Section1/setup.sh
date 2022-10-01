#Setup python env and install dependencies
conda init
conda create -y --name section1 python=3.9
conda activate section1
pip install -r config/requirements.txt

#Create run_job.sh with relative path
current_dir=`pwd`
papermill_dir=$(which papermill)
echo "
conda activate section1
cd ${current_dir}
${papermill_dir} Data_Pipelines.ipynb output/jupyter_notebooks/data_pipelines_output.ipynb
" > config/run_job.sh

chmod 777 -R .

#Setup cron schedule
echo "30 1 * * * bash ${current_dir}/config/run_job.sh" > config/cron_schedule
crontab config/cron_schedule
chmod 777 /home/hyphen/Desktop/Data-Engineer-Tech-Challenge/Section1/config/run_job.sh
crontab -l