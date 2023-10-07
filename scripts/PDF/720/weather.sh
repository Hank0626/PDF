if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi
seq_len=720
model_name=PDF

root_path_name=./dataset/
data_path_name=weather.csv
model_id_name=weather
data_name=custom
random_seed=2021

for pred_len in 96 192 336
do
    python -u run_longExp.py \
      --random_seed $random_seed \
      --is_training 1 \
      --root_path $root_path_name \
      --data_path $data_path_name \
      --model_id $model_id_name_$seq_len'_'$pred_len \
      --model $model_name \
      --data $data_name \
      --features M \
      --seq_len $seq_len \
      --pred_len $pred_len \
      --enc_in 21 \
      --e_layers 3 \
      --n_heads 16 \
      --d_model 64 \
      --d_ff 128 \
      --dropout 0.5 \
      --fc_dropout 0.2 \
      --kernel_list 3 11 15 23 27 \
      --period 144 180 720 \
      --patch_len 16 16 24 \
      --stride 16 16 24 \
      --des 'Exp' \
      --patience 20 \
      --train_epochs 100 \
      --itr 1 --batch_size 64 --learning_rate 0.00015 >logs/LongForecasting/$model_name'_'$model_id_name'_'$seq_len'_'$pred_len.log
done

for pred_len in 720
do
    python -u run_longExp.py \
      --random_seed $random_seed \
      --is_training 1 \
      --root_path $root_path_name \
      --data_path $data_path_name \
      --model_id $model_id_name_$seq_len'_'$pred_len \
      --model $model_name \
      --data $data_name \
      --features M \
      --seq_len $seq_len \
      --pred_len $pred_len \
      --enc_in 21 \
      --e_layers 3 \
      --n_heads 16 \
      --d_model 64 \
      --d_ff 128 \
      --dropout 0.55 \
      --fc_dropout 0.2 \
      --kernel_list 3 11 15 23 27 \
      --period 144 180 720 \
      --patch_len 12 15 24 \
      --stride 12 15 24 \
      --des 'Exp' \
      --patience 20 \
      --train_epochs 100 \
      --itr 1 --batch_size 128 --learning_rate 0.00005 >logs/LongForecasting/$model_name'_'$model_id_name'_'$seq_len'_'$pred_len.log
done