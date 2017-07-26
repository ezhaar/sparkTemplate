package org.telia.polystar

import scala.io.Source
import org.apache.spark.{SparkConf, SparkContext}
import org.scalatest.{BeforeAndAfter, FlatSpec, GivenWhenThen, Matchers}
import org.izhar.SparkTemplate

class StreamParsersTest extends FlatSpec with Matchers with BeforeAndAfter with GivenWhenThen {
  var sc: SparkContext = _

  before {
    val sparkConf = new SparkConf()
      .setMaster("local[*]")
      .setAppName("test-template")
    sc = new SparkContext(sparkConf)
  }

  after {
    sc.stop()
  }


}
