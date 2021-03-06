% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/buildTaipan.R
\name{buildTaipan}
\alias{buildTaipan}
\title{Build a taipan application}
\usage{
buildTaipan(questions, images, appdir, launch = TRUE,
  overwrite = FALSE, skip_check = FALSE, ext_restricted = TRUE)
}
\arguments{
\item{questions}{a \code{taipanQuestions} list of scene and selection questions}

\item{images}{a vector of image locations, can be local or URLs}

\item{appdir}{location to export the completed app}

\item{launch}{launch the app from the new directory after build is completed}

\item{overwrite}{replace the contents of the supplied location with the completed app}

\item{skip_check}{if TRUE, the requirement for user input to overwrite an
existing app is removed}

\item{ext_restricted}{if TRUE only JPEG (JPG), PNG, GIF, SVG are acceptable image
formats, all other types will be removed}
}
\description{
This function produces all necessary files for a shiny app.
It requires a list of questions to ask users, the location of the images to
display and the directory for the folder of shiny app files.
Changes can be made to the appearance by altering the css in the folder.
}
\examples{
\dontrun{
library(taipan)
library(shiny)

questions <- taipanQuestions(
  scene = div(radioButtons("graphic", label = "2D Graphic",
                           choices = list("Live image", "2D Graphic")),
              radioButtons("bg", label = "Background",
                           choices = list("Crowd",
                                          "Court", "Logo wall", "Not applicable")),
              radioButtons("person", label = "Detectable Person",
                           choices = list("Yes", "No")),
              radioButtons("shotangle", label = "Shot angle",
                           choices = list("Level with players",
                                          "Birds eye",
                                          "Upward angle")),
              radioButtons("situation", label = "Situation",
                           choices = list("Court in play",
                                          "Court player close-up",
                                          "Court close-up not player",
                                          "Crowd",
                                          "Off court close up of player",
                                          "Transition"))),
  selection = div(radioButtons("detect", label = "Detect Face",
                               choices = list("Player" ,
                                              "Other staff on court", "Fan", "None")),
                  radioButtons("obscured", label = "Face obscured",
                               choices = list("Yes", "No")),
                  radioButtons("lighting", label = "Lighting",
                               choices = list("Direct sunlight", "Shaded", "Partially shaded")),
                  radioButtons("headangle", label = "Head angle",
                               choices = list("Front on", "Back of head",
                                              "Profile", "Other")),
                  radioButtons("glasses", label = "Glasses",
                               choices = list("Yes", "No")),
                  radioButtons("visorhat", label = "Visor/hat",
                               choices = list("Yes", "No")))
)


images =
  c("https://raw.githubusercontent.com/srkob1/taipan/master/sample_images/blue_player.png",
  "https://raw.githubusercontent.com/srkob1/taipan/master/sample_images/pink_player.png",
  "https://raw.githubusercontent.com/srkob1/taipan/master/sample_images/red_player.png",
  "https://raw.githubusercontent.com/srkob1/taipan/master/sample_images/yellow_player.png",
  "https://raw.githubusercontent.com/srkob1/taipan/master/sample_images/disgruntled_player.png")


buildTaipan(
  questions = questions,
  images = images,
  appdir = file.path(tempdir(), "taipan")
)

}

}
