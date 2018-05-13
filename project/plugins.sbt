logLevel := Level.Warn

addSbtPlugin("com.typesafe.play" % "sbt-plugin" % "2.6.13")

addSbtPlugin("com.typesafe.sbt" % "sbt-digest" % "1.1.3")

addSbtPlugin("com.typesafe.sbt" % "sbt-rjs" % "1.0.10")

addSbtPlugin("com.typesafe.sbt" % "sbt-gzip" % "1.0.2")

addSbtPlugin("com.typesafe.sbt" % "sbt-uglify" % "2.0.0")

libraryDependencies += "com.typesafe.play" % "play-enhancer" % "1.2.2"

// https://mvnrepository.com/artifact/com.typesafe.play/play-ebean
addSbtPlugin("com.typesafe.sbt" % "sbt-play-ebean" % "4.0.3")

// Uncomment the next line for local development of the Play Authentication core:
addSbtPlugin("com.jsuereth" % "sbt-pgp" % "1.0.0")

addSbtPlugin("com.github.stonexx.sbt" % "sbt-babeljs" % "1.0.6")

// Uncomment the next line for local development of the Play Authentication core:
addSbtPlugin("com.github.gseitz" % "sbt-release" % "1.0.0")

//Elastic BeanstalkPlugin
resolvers += Resolver.url("bintray-kipsigman-sbt-plugins", url("http://dl.bintray.com/kipsigman/sbt-plugins"))(Resolver.ivyStylePatterns)

resolvers += "Typesafe repository" at "http://repo.typesafe.com/typesafe/releases/"

addSbtPlugin("kipsigman" % "sbt-elastic-beanstalk" % "0.1.4")