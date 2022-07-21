
model_path="/home/inspur/wr/dh/output/train/model_0_5600"
device='gpu'
predict_data_path="/home/inspur/wr/dh/multi-skill_dialogue/datasets/testB.txt"
export CUDA_VISIBLE_DEVICES="1"
sh_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd)  # current directory path
project_dir=${sh_dir}/

pretrained_model_path=$model_path
model_name=$(basename $pretrained_model_path)
output_dir=${project_dir}/output/predictB

batch_size=2
model_type="uniLM"
# decode strategy
decode_strategy="sampling" 


python ./run_dialogue.py \
    --do_train 0 --do_eval 0 \
    --do_predict 1 --test_data_path $predict_data_path \
    --output_dir $output_dir \
    --device $device --model_type $model_type \
    --pretrained_model_path $pretrained_model_path \
    --batch_size $batch_size \
    --decode_strategy $decode_strategy

