# Microsoft Machine Learning Notebooks
Main purpose is to add Microsoft Machine Learning for Apache Spark to the Jupyter Notebook Data Science Stack.

# Build
The docker images is build using `jupyter/datascience-notebook` as the base and then adds the JRE, PySpark, and MMLSpark to the image. During the build an initialization Python script is executed to pre-load the dependencies. This script is also added to '.ipython/profile_default/startup/' to allow new notebooks to already have the SparkContect available in the pre-initialized `sc` variable.

```shell
$ docker build . -t foulds/mmlspark-notebook:0.1
```

# Run
```shell
$ docker run --name mmlspark-notebook -p 8888:8888 foulds/mmlspark-notebook:0.1 start.sh jupyter lab
```

# Web References

## MMLSpark
- Microsoft Machine Learning for Apache Spark - https://github.com/Azure/mmlspark
- Lessons from Building a SparkML Compatible Machine Learning Library - https://www.youtube.com/watch?v=cEltmvfx51A
- MMLSpark Docker Demo - https://github.com/Azure/mmlspark/blob/master/tools/docker/demo/init_notebook.py

## MMLSpar Samples
- Sample Notebooks - https://github.com/Azure/mmlspark/tree/master/notebooks/samples
- Classification - Twitter Sentiment with Vowpal Wabbi - https://github.com/Azure/mmlspark/blob/master/notebooks/samples/Classification%20-%20Twitter%20Sentiment%20with%20Vowpal%20Wabbit.ipynb

## Jupyter
- Docker Hub: jupyter/datascience-notebook - https://hub.docker.com/r/jupyter/datascience-notebook
- Jupyter Base Dockerfile - https://github.com/jupyter/docker-stacks/blob/master/base-notebook/Dockerfile
- Jupyter Datascience Dockerfile - https://github.com/jupyter/docker-stacks/blob/master/datascience-notebook/Dockerfile
- Jupyter Docker Common Features - https://jupyter-docker-stacks.readthedocs.io/en/latest/using/common.html
- sudo password for jovyan - https://github.com/jupyter/docker-stacks/issues/408
- jovyan user cannot sudo in terminal - https://github.com/kubeflow/kubeflow/issues/425
- Python Startup Files - https://switowski.com/blog/ipython-startup-files

## Docker
- MMLSpark Docker Demo - https://github.com/Azure/mmlspark/blob/master/tools/docker/minimal/Dockerfile
- Zeppelin Dockerfile - https://github.com/apache/zeppelin/blob/master/scripts/docker/zeppelin/bin/Dockerfile
