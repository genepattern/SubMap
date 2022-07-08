#!/bin/sh

TEST_ROOT=$PWD
INPUT_FILE_DIRECTORIES=$TEST_ROOT/data
WORKING_DIR=$PWD/job_4
: ${GP_METADATA_DIR=$WORKING_DIR/.gp_metadata}

#
# for most modules you only need to change the COMMAND_LINE and DOCKER_CONTAINER to reuse this script
# - it assumes your wrapper is built into the container.  In this example at /submap/run_submap.R
#
COMMAND_LINE="Rscript /submap/run_submap.R --input.data.A=$PWD/data/cluster2.for.SubMap.GSE17536.gct --input.data.B=$PWD/data/skcm.subtype.for.SubMap.GSE17536.gct --input.cls.A=$PWD/data/cluster2.for.SubMap.GSE17536.cls --input.cls.B=$PWD/data/skcm.subtype.for.SubMap.GSE17536.cls --output.filename=submap --num.marker.genes=10 --num.perm=10 --num.perm.fisher=100 --weighted.score.type=1 --null.distribution=pool --p.value.correction=Bonferroni --cluster.rows=1 --cluster.columns=1 --nominal.p.value.matrix=T --create.legend=T --random.seed=47365321"

DOCKER_CONTAINER=genepattern/submap:0.1 

mkdir -p $WORKING_DIR
mkdir -p $GP_METADATA_DIR

#
# This extra file is just to make it easier to handle escaped characters and is not strictly necessary
#
EXEC_SHELL=$GP_METADATA_DIR/local_exec.sh
echo "#!/bin/bash\n" > $EXEC_SHELL
echo "echo INSIDE\n" >>$EXEC_SHELL
echo $COMMAND_LINE >>$EXEC_SHELL
echo "\n " >>$EXEC_SHELL

chmod a+x $EXEC_SHELL
echo SHELL IS $EXEC_SHELL

REMOTE_COMMAND="bash $EXEC_SHELL"

echo "docker run -v $PWD:$PWD -w $WORKING_DIR  $DOCKER_CONTAINER $REMOTE_COMMAND"
docker run -v $PWD:$PWD -w $WORKING_DIR  $DOCKER_CONTAINER $REMOTE_COMMAND

#
# if you need to debug, uncomment the line below and then you can run manually within the container
# and get the command line from the echo above the normal docker run command
#docker run -it -v $PWD:$PWD -w $WORKING_DIR  $DOCKER_CONTAINER bash


