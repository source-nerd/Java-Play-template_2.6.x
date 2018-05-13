
name := "fcConverter"
 
version := "1.0" 
      
lazy val `fcconverter` = (project in file(".")).enablePlugins(PlayJava, PlayEbean, ElasticBeanstalkPlugin, SbtWeb).settings(
  name := "fcconverter",
  libraryDependencies ++= appDependencies
)

JsEngineKeys.engineType := JsEngineKeys.EngineType.Node

scalaVersion := "2.12.4"

val appDependencies = Seq(
  // Comment the next line for local development of the Play Authentication core:
  // Use the latest release version when copying this code, e.g. "0.9.0"
  //  "com.feth" %% "play-authenticate" % "0.9.0-SNAPSHOT",
  javaJdbc,
  ehcache,
  javaWs,
  cacheApi,
  "org.webjars" % "npm" % "5.0.0"
)


libraryDependencies += guice

libraryDependencies += jcache

libraryDependencies += "com.typesafe.play" %% "play-json" % "2.6.0"

// https://mvnrepository.com/artifact/mysql/mysql-connector-java
libraryDependencies += "mysql" % "mysql-connector-java" % "8.0.7-dmr"

// https://mvnrepository.com/artifact/org.mindrot/jbcrypt
libraryDependencies += "org.mindrot" % "jbcrypt" % "0.4"

libraryDependencies += "org.jsr107.ri" % "cache-annotations-ri-guice" % "1.0.0"

libraryDependencies += evolutions

// https://mvnrepository.com/artifact/junit/junit
libraryDependencies += "junit" % "junit" % "4.12" % "test"

// https://mvnrepository.com/artifact/com.amazonaws/aws-java-sdk
libraryDependencies += "com.amazonaws" % "aws-java-sdk" % "1.11.186"

// add resolver for easymail snapshots
resolvers += Resolver.sonatypeRepo("snapshots")

resolvers += "scalaz-bintray" at "https://dl.bintray.com/scalaz/releases"

resolvers += "scalaz-bintray" at "https://dl.bintray.com/scalaz/releases"

routesGenerator := InjectedRoutesGenerator

unmanagedResourceDirectories in Test <+=  baseDirectory ( _ /"target/web/public/test" )  

      