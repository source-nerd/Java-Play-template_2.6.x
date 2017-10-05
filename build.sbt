
name := "hsse"
 
version := "1.0" 
      
lazy val `hsse` = (project in file(".")).enablePlugins(PlayJava)

resolvers += "Akka Snapshot Repository" at "http://repo.akka.io/snapshots/"
      
scalaVersion := "2.12.3"

libraryDependencies ++= Seq( jdbc , specs2 % Test )

libraryDependencies += guice
//CORS Filter
libraryDependencies += filters

libraryDependencies += evolutions


unmanagedResourceDirectories in Test <+=  baseDirectory ( _ /"target/web/public/test" )

resolvers += "scalaz-bintray" at "https://dl.bintray.com/scalaz/releases"

      