!#/usr/bin/bash

# If file exist
cleanList="clean.list"
inactiveList="inactive.list"
invalidList="invalid.list"


if [[ -f ${cleanList} ]]
then 
    rm ${cleanList}
fi

if [[ -f ${inactiveList} ]]
then 
    rm ${inactiveList}
fi

if [[ -f ${invalidList} ]]
then 
    rm ${invalidList}
fi

if [[ -f output/domains/ACTIVE/list ]]
then
    tail -$(($(wc -l output/domains/ACTIVE/list | cut -d ' ' -f1)-3)) output/domains/ACTIVE/list >> ${cleanList}
else 
    echo "" > ${cleanList}
fi

if [[ -f output/domains/INACTIVE/list ]]
then
    tail -$(($(wc -l output/domains/INACTIVE/list | cut -d ' ' -f1)-3)) output/domains/INACTIVE/list >> ${inactiveList}
else 
    echo "" > ${inactiveList}
fi

if [[ -f output/domains/INVALID/list ]]
then
    tail -$(($(wc -l output/domains/INVALID/list | cut -d ' ' -f1)-3)) output/domains/INVALID/list >> ${invalidList}
else 
    echo "" > ${invalidList}
fi