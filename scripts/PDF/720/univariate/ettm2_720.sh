if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi
seq_len=720
model_name=PDF
root_path_name=./dataset/
data_path_name=ETTm2.csv
model_id_name=ETTm2
data_name=ETTm2

random_seed=2021
for pred_len in 96 192 336 720
do
    CUDA_VISIBLE_DEVICES=3\
    python -u run_longExp.py \
      --random_seed $random_seed \
      --is_training 1 \
      --root_path $root_path_name \
      --data_path $data_path_name \
      --model_id $model_id_name_$seq_len'_'$pred_len \
      --model $model_name \
      --data $data_name \
      --features S \
      --seq_len $seq_len \
      --pred_len $pred_len \
      --enc_in 1 \
      --e_layers 3 \
      --n_heads 16 \
      --d_model 48 \
      --d_ff 48 \
      --kernel_list 3 7 11 \
      --period 102 720\
      --dropout 0.45 \
      --fc_dropout 0.2 \
      --patch_len 7 48\
      --stride 7 48\
      --des 'Exp' \
      --train_epochs 100 \
      --patience 10 \
      --lradj 'TST' \
      --itr 1 --batch_size 128 --learning_rate 0.0001 >logs/LongForecasting/$model_name'_'$model_id_name'_'$seq_len'_'$pred_len.log
done
