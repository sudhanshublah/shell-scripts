echo Enter Namespace

read i

kubectl config set-context –current --namespace=$i


for n in $(kubectl get deploy --no-headers -o custom-columns=":metadata.name")
do
    mkdir -p $(dirname $n)
    kubectl get deploy -o=yaml $n >> $n.yaml
    echo "---" >> $n.yaml
    kubectl get service -o=yaml $n >> $n.yaml

done
