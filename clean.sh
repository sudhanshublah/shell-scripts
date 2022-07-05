for n in $(ls | grep .yaml)
do
    cat $n | yq eval 'del(.status)' -  | yq eval 'del (.metadata.managedFields)' -  | yq eval 'del (.metadata.annotations)' -| yq eval 'del (.spec.tolerations)' -  | yq eval 'del(.metadata.ownerReferences)' -  | yq eval 'del(.metadata.resourceVersion)' -  | yqeval 'del(.metadata.uid)' -  | yq eval 'del(.metadata.selfLink)' -  | yq eval 'del(.metadata.creationTimestamp)' -  |yq eval 'del(.metadata.generateName)' - | yq eval 'del(.spec.template.spec.terminationGracePeriodSeconds)' - | yq eval 'del(.spec.template.spec.containers.[0].terminationMessagePath)' - | yq eval 'del(.spec.template.spec.containers.[0].terminationMessagePolicy)' - | yq eval 'del(.spec.namespace)' - | yq eval 'del(.spec.generation)' - | yq eval 'del(.spec.revisionHistoryLimit)' - | yq eval 'del(.spec.progressDeadlineSeconds)' - | yq eval 'del(.spec.template.spec.restartPolicy)' - | yq eval 'del(.spec.template.spec.schedulerName)' - | yq eval 'del(.spec.template.spec.securityContext)' - | yq eval 'del(.spec.template.metadata.creationTimestamp)' - | yq eval 'del(.spec.strategy.rollingUpdate.maxUnavailable)' - | yq eval 'del(.spec.template.spec.containers.[0].ports.[0].protocol)' - | yq eval 'del(.spec.template.spec.dnsPolicy)' - > test.yaml
    rm -rf $n
    mv test.yaml $n

done

