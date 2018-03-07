# This snippet is intended to be used to transfer a secret to another namespace
# `jq` performs an on-the-fly replacement of the NAMESPACE
# from the original one (probably 'openshift') to the target one.

echo "Enter source namespace (probably 'openshift'): "
read SOURCE_NAMESPACE
echo "Enter secret name: "
read SECRET
echo "Enter target namespace: "
read TARGET_NAMESPACE

oc get secrets/$SECRET -n $SOURCE_NAMESPACE -o json | \
  jq -r --arg NAMESPACE $TARGET_NAMESPACE '.metadata.namespace = $NAMESPACE' | \
  oc create -f -

