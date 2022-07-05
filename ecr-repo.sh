for i in $(aws ecr describe-repositories --query "repositories[].[repositoryName]" --output text --no-cli-pager)
do
    aws ecr put-lifecycle-policy \
    --repository-name $i \
    --lifecycle-policy-text "file://policy.json"
done