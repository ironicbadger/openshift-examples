#!/bin/bash

sizes=(256Mi 512Mi 768Mi 1Gi 1512Mi 2Gi 5Gi 10Gi 15Gi 20Gi)

si=0
for vol in $(seq 1 100); do
   size=${sizes[$si]}
   pv=pv$vol

   sed -e "s/%pv/$pv/g" -e "s/%size/$size/g" pv-template.yml | oc create -f -
  
   si=$(($si+1))
   [[ $si -ge 10 ]] && si=0
done

exit 0
