#/bin/bash

echo 'Starting Packer Cleanup'
result=$(aws ec2 describe-snapshots --owner self | grep ami-)
#echo $result
IFS=' ' read -a myami <<< "$result"
#echo ${myami[5]}
result=$(aws ec2 describe-snapshots --owner self | grep SnapshotId)
#echo $result
IFS='"' read -a mysnap <<< "$result"
#echo ${mysnap[3]}
echo "Deregister image ${myami[5]}"
aws ec2 deregister-image --image-id ${myami[5]}
echo "Deleting snapshot ${mysnap[3]}"
aws ec2 delete-snapshot --snapshot-id ${mysnap[3]}
echo 'Completed Packer Cleanup'
