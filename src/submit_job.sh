#!/usr/bin/env bash

function usage()
{
    echo "Usage:"
    echo "./submit_job.sh"
    echo "-e env"
    echo "-y year"
    echo "-m month"
    echo "-d date"
    echo "-H hour (* for whole day)"
    exit 1
}

while getopts ":hh:e:y:m:d:H:" opt; do
  case $opt in
    h)
      usage
      ;;
    e)
      ENV=$OPTARG
      JAVA_OPTIONS="$JAVA_OPTIONS -Denvironment=$OPTARG"
      ;;
    y)
      YEAR=$OPTARG
      JAVA_OPTIONS="$JAVA_OPTIONS -Dyear=$OPTARG"
      ;;
    m)
      MONTH=$OPTARG
      JAVA_OPTIONS="$JAVA_OPTIONS -Dmonth=$OPTARG"
      ;;
    d)
      DAY=$OPTARG
      JAVA_OPTIONS="$JAVA_OPTIONS -Ddate=$OPTARG"
      ;;
    H)
      HOUR=$OPTARG
      JAVA_OPTIONS="$JAVA_OPTIONS -Dhour=$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      exit 1
      ;;
    :)
      echo "Missing argument for -$OPTARG" >&2
      usage
      exit 1
      ;;
  esac
done

if [ -z $ENV ]; then
  echo "ERROR: no Environment was given"
  usage
fi

if [ -z $YEAR ]; then
  echo "ERROR: No Year was given"
  usage
fi

if [ -z $MONTH ]; then
  echo "ERROR: no Month was given"
  usage
fi
if [ -z $DAY ]; then
  echo "ERROR: no Day was given"
  usage
fi

if [ -z $HOUR ]; then
  echo "ERROR: No Hour was given"
  usage
fi

export YARN_CONF_DIR=/etc/hadoop/conf
export SPARK_HOME=/opt/spark-1.6.3-bin-hadoop2.6


${SPARK_HOME}/bin/spark-submit \
 --class org.izhar.SparkTemplate  \
 --num-executors 4 --driver-memory 4g\
 --executor-memory 4g --executor-cores 4 \
 --driver-java-options "${JAVA_OPTIONS}"\
 --master yarn --deploy-mode client sparktemplate-1.0-SNAPSHOT-jar-with-dependencies.jar

