#!/bin/sh

TEST_ROOT=$PWD

INPUT_FILE_DIRECTORIES=$TEST_ROOT/data
WORKING_DIR=$PWD/job_4

COMMAND_LINE="Rscript  --input.data.A=$PWD/data/cluster2.for.SubMap.GSE17536.gct --input.data.B=$PWD/data/skcm.subtype.for.SubMap.GSE17536.gct --input.cls.A=$PWD/data/cluster2.for.SubMap.GSE17536.cls --input.cls.B=$PWD/data/skcm.subtype.for.SubMap.GSE17536.cls --output.filename=submap --num.marker.genes=10 --num.perm=10 --num.perm.fisher=100 --weighted.score.type=1 --null.distribution=pool --p.value.correction=Bonferroni --cluster.rows=1 --cluster.columns=1 --nominal.p.value.matrix=T --create.legend=T --random.seed=47365321"

DOCKER_CONTAINER=genepattern/submap:0.1 

mkdir -p $WORKING_DIR
mkdir -p $GP_METADATA_DIR

echo "Container will execute $REMOTE_COMMAND   from $PWD <EOM>\n"

docker run -v $PWD:$PWD -w $WORKING_DIR  $DOCKER_CONTAINER $COMMAND_LINE



