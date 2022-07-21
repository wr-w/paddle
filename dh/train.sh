train_data_path="/home/inspur/wr/dh/multi-skill_dialogue/datasets/train.txt"
valid_data_path="/home/inspur/wr/dh/multi-skill_dialogue/datasets/dev.txt"
device='gpu'
export CUDA_VISIBLE_DEVICES="1"
sh_dir=$(cd $(dirname ${BASH_SOURCE[0]}); pwd)  # current directory path
project_dir=${sh_dir}/

# output_dir=${project_dir}/output/train/$(date +%m%d_%H%M)  # output directory
output_dir=${project_dir}/output/train

model_type="uniLM"
# model_type="ernie"
# pretrained_model_path="ernie-3.0-medium-zh"
pretrained_model_path="unified_transformer-12L-cn"
train_epochs=50
batch_size=8192


lr=1e-4
weight_decay=0.02
logging_steps=1000
save_steps=100000
warmup_steps=4000
max_grad_norm=0.1



python run_dialogue.py \
    --do_train 1 --train_data_path $train_data_path \
    --do_eval 1 --valid_data_path $valid_data_path \
    --do_predict 0 \
    --output_dir $output_dir \
    --device $device \
    --seed 123456 \
    --model_type $model_type \
    --pretrained_model_path $pretrained_model_path \
    --train_epochs $train_epochs \
    --batch_size $batch_size \
    --logging_steps $logging_steps \
    --save_steps $save_steps \
    --lr $lr \
    --weight_decay $weight_decay \
    --warmup_steps $warmup_steps \
    --max_grad_norm $max_grad_norm 
