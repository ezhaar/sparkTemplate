package org.izhar

import java.io.{FileNotFoundException, IOException}

import org.apache.hadoop.fs.{FileSystem, Path}
import org.apache.spark.sql.hive.HiveContext
import org.apache.spark.{SparkConf, SparkContext}
import org.apache.log4j.Logger

object SparkTemplate {

  val logger: Logger = Logger.getLogger(SparkTemplate.getClass)

  def main(args: Array[String]): Unit = {

    // user input
    val env = System.getProperty("environment")
    val year = System.getProperty("year")
    val month = System.getProperty("month")
    val day = System.getProperty("date")
    val hour = System.getProperty("hour")
    val given_datetime = s"$year/$month/$day/$hour"

    logger.info("===================================")
    logger.info("Processing data with arguments:")
    logger.info(s"Environment: $env")
    logger.info(s"Date/Hour: $given_datetime")
    logger.info("===================================")

    logger.info("===================================")
    logger.info("Creating Spark Context")
    logger.info("===================================")
    // create spark and sql contexts and set properties
    val sparkConfig = new SparkConf().setAppName("someName")
    val sparkContext = new SparkContext(sparkConfig)
    val sqlContext = new HiveContext(sparkContext)
    import sqlContext.implicits._
    val fs = FileSystem.get(sparkContext.hadoopConfiguration)
    sparkContext.stop()

  }

}
