if [ $# != 1 ]; then
    echo "Usage: $0 epoch"
    exit 1
fi

./sample12/train.py -g 0 --epoch $1 --depth 0
cp -r sample12/results sample12/results_depth0
cp -r sample12/img sample12/img_depth0

for i in `seq 1 6`; do
    ./sample12/train.py -g 0 --gen sample12/results/gen --dis sample12/results/dis --optg sample12/results/opt_g --optd sample12/results/opt_d --epoch $1 --depth $i
    cp -r sample12/results sample12/results_depth$i
    cp -r sample12/img sample12/img_depth$i
done
